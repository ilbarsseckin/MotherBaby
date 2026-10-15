import 'package:shared_preferences/shared_preferences.dart';

/// Hamilelik tarihi nasıl girildi: son adet başlangıcı mı, tahmini doğum mu.
enum DateMode { lastPeriod, dueDate }

class Profile {
  final String babyName;
  final String sex; // [sexes] kodlarından biri
  final String kin; // [kins] kodlarından biri
  final DateMode mode;
  final DateTime date;

  /// Doğum gerçekleştiyse doğum tarihi; uygulama doğum sonrası moduna geçer.
  final DateTime? birthDate;

  const Profile({
    required this.babyName,
    required this.sex,
    required this.kin,
    required this.mode,
    required this.date,
    this.birthDate,
  });

  bool get isBorn => birthDate != null;

  Profile withBirthDate(DateTime? d) =>
      Profile(babyName: babyName, sex: sex, kin: kin, mode: mode, date: date, birthDate: d);

  /// Doğumdan bu yana geçen tam ay ve gün.
  (int, int) get age {
    final b = birthDate!;
    final now = DateTime.now();
    var months = (now.year - b.year) * 12 + now.month - b.month;
    if (now.day < b.day) months--;
    if (months < 0) return (0, 0);
    final monthStart = DateTime(b.year, b.month + months, b.day);
    return (months, DateTime(now.year, now.month, now.day).difference(monthStart).inDays.clamp(0, 31));
  }

  static const sexes = ['girl', 'boy', 'unknown'];
  static const kins = [
    'mother', 'father', 'auntMaternal', 'auntPaternal', 'uncleMaternal',
    'unclePaternal', 'sibling', 'grandmother', 'grandfather', 'other',
  ];

  // İlk sürümde Türkçe metin olarak kaydedilen değerler
  static const _oldSex = {'KIZ': 'girl', 'ERKEK': 'boy', 'BELLİ DEĞİL': 'unknown'};
  static const _oldKin = {
    'ANNE': 'mother', 'BABA': 'father', 'DAYI': 'uncleMaternal', 'AMCA': 'unclePaternal',
    'TEYZE': 'auntMaternal', 'HALA': 'auntPaternal', 'KARDEŞ': 'sibling', 'ABİ': 'sibling', 'ABLA': 'sibling',
  };

  static String _code(String? v, List<String> codes, Map<String, String> old, String fallback) {
    if (v == null) return fallback;
    if (codes.contains(v)) return v;
    return old[v] ?? fallback;
  }

  DateTime get dueDate =>
      mode == DateMode.dueDate ? date : date.add(const Duration(days: 280));

  Pregnancy get pregnancy => Pregnancy.fromDueDate(dueDate);

  static Future<Profile?> load() async {
    final p = await SharedPreferences.getInstance();
    final name = p.getString('babyName');
    final date = p.getString('date');
    if (name == null || date == null) return null;
    return Profile(
      babyName: name,
      sex: _code(p.getString('sex'), sexes, _oldSex, 'unknown'),
      kin: _code(p.getString('kin'), kins, _oldKin, 'mother'),
      mode: p.getString('mode') == 'due' ? DateMode.dueDate : DateMode.lastPeriod,
      date: DateTime.parse(date),
      birthDate: DateTime.tryParse(p.getString('birthDate') ?? ''),
    );
  }

  Future<void> save() async {
    final p = await SharedPreferences.getInstance();
    await p.setString('babyName', babyName);
    await p.setString('sex', sex);
    await p.setString('kin', kin);
    await p.setString('mode', mode == DateMode.dueDate ? 'due' : 'lmp');
    await p.setString('date', date.toIso8601String());
    if (birthDate == null) {
      await p.remove('birthDate');
    } else {
      await p.setString('birthDate', birthDate!.toIso8601String());
    }
  }

  /// Profili siler (dil seçimi korunur).
  static Future<void> clear() async {
    final p = await SharedPreferences.getInstance();
    for (final k in ['babyName', 'sex', 'kin', 'mode', 'date', 'birthDate']) {
      await p.remove(k);
    }
  }
}

/// 280 günlük (40 hafta) hamilelik hesabı.
class Pregnancy {
  final DateTime dueDate;
  final int daysPassed; // 0..280
  final int daysLeft;

  Pregnancy._(this.dueDate, this.daysPassed, this.daysLeft);

  factory Pregnancy.fromDueDate(DateTime due, {DateTime? today}) {
    final now = today ?? DateTime.now();
    final t = DateTime(now.year, now.month, now.day);
    final d = DateTime(due.year, due.month, due.day);
    final left = d.difference(t).inDays;
    final passed = (280 - left).clamp(0, 280);
    return Pregnancy._(d, passed, left < 0 ? 0 : left);
  }

  int get week => daysPassed ~/ 7;
  int get dayOfWeek => daysPassed % 7;
  int get trimester => week <= 13 ? 1 : (week <= 26 ? 2 : 3);
  double get progress => daysPassed / 280;
}
