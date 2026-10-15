import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import 'baby_db.dart';
import 'content.dart';

/// Tüm yerel veriler tek bir SQLite veritabanında tutulur.
class AppDb {
  AppDb._();
  static Database? _db;

  static Future<Database> get instance async {
    if (_db != null) return _db!;
    final dir = await getDatabasesPath();
    _db = await openDatabase(
      p.join(dir, 'bebegim.db'),
      version: 3,
      onUpgrade: (db, oldV, _) async {
        // v2: hazır liste maddeleri dil bağımsız koda (sıra no) geçti
        if (oldV < 2) {
          await db.execute('DROP TABLE IF EXISTS checklist');
          await _createChecklist(db);
          await _seedChecklists(db);
        }
        if (oldV < 3) await createBabyTables(db);
      },
      onCreate: (db, _) async {
        await db.execute('''CREATE TABLE weights(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          week INTEGER NOT NULL,
          kg REAL NOT NULL,
          date TEXT NOT NULL UNIQUE)''');
        await db.execute('''CREATE TABLE medicines(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          time TEXT NOT NULL,
          meal TEXT NOT NULL,
          active INTEGER NOT NULL)''');
        await db.execute('''CREATE TABLE kicks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT NOT NULL,
          seconds INTEGER NOT NULL,
          count INTEGER NOT NULL)''');
        await db.execute('''CREATE TABLE contractions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          start TEXT NOT NULL,
          seconds INTEGER NOT NULL)''');
        await _createChecklist(db);
        await _seedChecklists(db);
        await createBabyTables(db);
      },
    );
    return _db!;
  }

  /// Hazır maddelerde [code] içerik dosyasındaki sıra numarasıdır; başlık
  /// seçili dile göre oradan okunur. Kullanıcının eklediklerinde [title] tutulur.
  static Future<void> _createChecklist(Database db) => db.execute('''CREATE TABLE checklist(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          list TEXT NOT NULL,
          code INTEGER,
          grp TEXT NOT NULL,
          title TEXT NOT NULL DEFAULT '',
          done INTEGER NOT NULL DEFAULT 0,
          custom INTEGER NOT NULL DEFAULT 0)''');

  static Future<void> _seedChecklists(Database db) async {
    final batch = db.batch();
    for (final kind in ChecklistKind.values) {
      final items = AppContent.current.listItems(kind.name);
      for (var i = 0; i < items.length; i++) {
        batch.insert('checklist', {'list': kind.key, 'code': i, 'grp': items[i].$1});
      }
    }
    await batch.commit(noResult: true);
  }

  /// Fabrika ayarları: tüm tabloları siler ve listeleri yeniden doldurur.
  static Future<void> resetAll() async {
    final db = await instance;
    for (final t in ['weights', 'medicines', 'kicks', 'contractions', 'checklist', ...babyTables]) {
      await db.delete(t);
    }
    await _seedChecklists(db);
  }
}

/// [name] içerik dosyasındaki liste adıdır (needs, bag, tests).
enum ChecklistKind {
  needs('ihtiyac'),
  bag('canta'),
  tests('test');

  const ChecklistKind(this.key);
  final String key;
}

class ChecklistItem {
  final int id;
  final ChecklistKind kind;
  final int? code;
  final String grp;
  final String _title;
  final bool done;
  final bool custom;
  ChecklistItem.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        kind = ChecklistKind.values.firstWhere((k) => k.key == m['list']),
        code = m['code'] as int?,
        grp = m['grp'] as String,
        _title = m['title'] as String,
        done = (m['done'] as int) == 1,
        custom = (m['custom'] as int) == 1;

  /// Seçili dildeki başlık.
  String get title => custom || code == null ? _title : AppContent.current.itemTitle(kind.name, code!);
}

class ChecklistRepo {
  static Future<List<ChecklistItem>> items(ChecklistKind kind) async {
    final db = await AppDb.instance;
    final rows = await db.query('checklist', where: 'list = ?', whereArgs: [kind.key], orderBy: 'id');
    return rows.map(ChecklistItem.fromMap).toList();
  }

  static Future<void> setDone(int id, bool done) async {
    final db = await AppDb.instance;
    await db.update('checklist', {'done': done ? 1 : 0}, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> add(ChecklistKind kind, String title) async {
    final db = await AppDb.instance;
    await db.insert('checklist', {'list': kind.key, 'grp': 'custom', 'title': title, 'custom': 1});
  }

  static Future<void> remove(int id) async {
    final db = await AppDb.instance;
    await db.delete('checklist', where: 'id = ?', whereArgs: [id]);
  }

  /// Tamamlanma oranı (0..1).
  static Future<double> progress(ChecklistKind kind) async {
    final list = await items(kind);
    if (list.isEmpty) return 0;
    return list.where((e) => e.done).length / list.length;
  }
}

class WeightEntry {
  final int id;
  final int week;
  final double kg;
  final DateTime date;
  WeightEntry.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        week = m['week'] as int,
        kg = (m['kg'] as num).toDouble(),
        date = DateTime.parse(m['date'] as String);
}

class WeightRepo {
  /// En eskiden en yeniye.
  static Future<List<WeightEntry>> all() async {
    final db = await AppDb.instance;
    final rows = await db.query('weights', orderBy: 'date');
    return rows.map(WeightEntry.fromMap).toList();
  }

  /// Aynı gün için ikinci kayıt öncekinin yerine geçer.
  static Future<void> upsert(DateTime day, int week, double kg) async {
    final db = await AppDb.instance;
    final key = DateTime(day.year, day.month, day.day).toIso8601String().substring(0, 10);
    await db.insert('weights', {'week': week, 'kg': kg, 'date': key},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> remove(int id) async {
    final db = await AppDb.instance;
    await db.delete('weights', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> clear() async {
    final db = await AppDb.instance;
    await db.delete('weights');
  }
}

class Medicine {
  final int? id;
  final String name;
  final int hour;
  final int minute;
  final String meal; // empty (aç), full (tok), any (fark etmez)
  final bool active;

  const Medicine({this.id, required this.name, required this.hour, required this.minute, required this.meal, required this.active});

  static const meals = ['empty', 'full', 'any'];

  String get timeText => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  Map<String, Object?> toMap() => {'name': name, 'time': timeText, 'meal': meal, 'active': active ? 1 : 0};

  factory Medicine.fromMap(Map<String, Object?> m) {
    final t = (m['time'] as String).split(':');
    return Medicine(
      id: m['id'] as int,
      name: m['name'] as String,
      hour: int.parse(t[0]),
      minute: int.parse(t[1]),
      meal: switch (m['meal']) {
        'AÇ' || 'empty' => 'empty',
        'TOK' || 'full' => 'full',
        _ => 'any',
      },
      active: (m['active'] as int) == 1,
    );
  }
}

class MedicineRepo {
  static Future<List<Medicine>> all() async {
    final db = await AppDb.instance;
    final rows = await db.query('medicines', orderBy: 'time');
    return rows.map(Medicine.fromMap).toList();
  }

  static Future<int> save(Medicine m) async {
    final db = await AppDb.instance;
    if (m.id == null) return db.insert('medicines', m.toMap());
    await db.update('medicines', m.toMap(), where: 'id = ?', whereArgs: [m.id]);
    return m.id!;
  }

  static Future<void> remove(int id) async {
    final db = await AppDb.instance;
    await db.delete('medicines', where: 'id = ?', whereArgs: [id]);
  }
}

class KickSession {
  final int id;
  final DateTime date;
  final int seconds;
  final int count;
  KickSession.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        date = DateTime.parse(m['date'] as String),
        seconds = m['seconds'] as int,
        count = m['count'] as int;
}

class Contraction {
  final int id;
  final DateTime start;
  final int seconds;
  Contraction.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        start = DateTime.parse(m['start'] as String),
        seconds = m['seconds'] as int;
}

class CounterRepo {
  static Future<List<KickSession>> kicks() async {
    final db = await AppDb.instance;
    return (await db.query('kicks', orderBy: 'id DESC')).map(KickSession.fromMap).toList();
  }

  static Future<void> addKick(DateTime date, int seconds, int count) async {
    final db = await AppDb.instance;
    await db.insert('kicks', {'date': date.toIso8601String(), 'seconds': seconds, 'count': count});
  }

  static Future<void> removeKick(int id) async {
    final db = await AppDb.instance;
    await db.delete('kicks', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Contraction>> contractions() async {
    final db = await AppDb.instance;
    return (await db.query('contractions', orderBy: 'id DESC')).map(Contraction.fromMap).toList();
  }

  static Future<void> addContraction(DateTime start, int seconds) async {
    final db = await AppDb.instance;
    await db.insert('contractions', {'start': start.toIso8601String(), 'seconds': seconds});
  }

  static Future<void> removeContraction(int id) async {
    final db = await AppDb.instance;
    await db.delete('contractions', where: 'id = ?', whereArgs: [id]);
  }
}
