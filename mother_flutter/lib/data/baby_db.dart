import 'package:sqflite/sqflite.dart';

import 'db.dart';

/// Doğum sonrası takip tabloları (veritabanı sürüm 3).
Future<void> createBabyTables(Database db) async {
  await db.execute('''CREATE TABLE IF NOT EXISTS feedings(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    start TEXT NOT NULL,
    kind TEXT NOT NULL,
    seconds INTEGER NOT NULL DEFAULT 0,
    ml INTEGER NOT NULL DEFAULT 0)''');
  await db.execute('''CREATE TABLE IF NOT EXISTS diapers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    time TEXT NOT NULL,
    kind TEXT NOT NULL)''');
  await db.execute('''CREATE TABLE IF NOT EXISTS sleeps(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    start TEXT NOT NULL,
    seconds INTEGER NOT NULL)''');
  await db.execute('''CREATE TABLE IF NOT EXISTS growth(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    kg REAL,
    cm REAL,
    head REAL)''');
}

const babyTables = ['feedings', 'diapers', 'sleeps', 'growth'];

/// Beslenme: sol/sağ meme (süre), biberon (ml), ek gıda.
class Feeding {
  final int id;
  final DateTime start;
  final String kind; // left, right, bottle, solid
  final int seconds;
  final int ml;
  Feeding.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        start = DateTime.parse(m['start'] as String),
        kind = m['kind'] as String,
        seconds = m['seconds'] as int,
        ml = m['ml'] as int;
}

class Diaper {
  final int id;
  final DateTime time;
  final String kind; // wet, dirty, both
  Diaper.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        time = DateTime.parse(m['time'] as String),
        kind = m['kind'] as String;
}

class Sleep {
  final int id;
  final DateTime start;
  final int seconds;
  Sleep.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        start = DateTime.parse(m['start'] as String),
        seconds = m['seconds'] as int;
}

class Growth {
  final int id;
  final DateTime date;
  final double? kg;
  final double? cm;
  final double? head;
  Growth.fromMap(Map<String, Object?> m)
      : id = m['id'] as int,
        date = DateTime.parse(m['date'] as String),
        kg = (m['kg'] as num?)?.toDouble(),
        cm = (m['cm'] as num?)?.toDouble(),
        head = (m['head'] as num?)?.toDouble();
}

class BabyRepo {
  static Future<List<Feeding>> feedings({int limit = 200}) async {
    final db = await AppDb.instance;
    return (await db.query('feedings', orderBy: 'start DESC', limit: limit)).map(Feeding.fromMap).toList();
  }

  static Future<void> addFeeding(DateTime start, String kind, {int seconds = 0, int ml = 0}) async {
    final db = await AppDb.instance;
    await db.insert('feedings', {'start': start.toIso8601String(), 'kind': kind, 'seconds': seconds, 'ml': ml});
  }

  static Future<List<Diaper>> diapers({int limit = 200}) async {
    final db = await AppDb.instance;
    return (await db.query('diapers', orderBy: 'time DESC', limit: limit)).map(Diaper.fromMap).toList();
  }

  static Future<void> addDiaper(String kind) async {
    final db = await AppDb.instance;
    await db.insert('diapers', {'time': DateTime.now().toIso8601String(), 'kind': kind});
  }

  static Future<List<Sleep>> sleeps({int limit = 200}) async {
    final db = await AppDb.instance;
    return (await db.query('sleeps', orderBy: 'start DESC', limit: limit)).map(Sleep.fromMap).toList();
  }

  static Future<void> addSleep(DateTime start, int seconds) async {
    final db = await AppDb.instance;
    await db.insert('sleeps', {'start': start.toIso8601String(), 'seconds': seconds});
  }

  /// En eskiden en yeniye.
  static Future<List<Growth>> growth() async {
    final db = await AppDb.instance;
    return (await db.query('growth', orderBy: 'date')).map(Growth.fromMap).toList();
  }

  static Future<void> addGrowth(DateTime date, {double? kg, double? cm, double? head}) async {
    final db = await AppDb.instance;
    await db.insert('growth', {'date': date.toIso8601String(), 'kg': kg, 'cm': cm, 'head': head});
  }

  static Future<void> remove(String table, int id) async {
    final db = await AppDb.instance;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}

/// DSÖ (WHO) büyüme standartlarına göre ayına göre ortanca ağırlık (kg).
const whoWeightGirls = [3.2, 4.2, 5.1, 5.8, 6.4, 6.9, 7.3, 7.6, 7.9, 8.2, 8.5, 8.7, 8.9];
const whoWeightBoys = [3.3, 4.5, 5.6, 6.4, 7.0, 7.5, 7.9, 8.3, 8.6, 8.9, 9.2, 9.4, 9.6];
