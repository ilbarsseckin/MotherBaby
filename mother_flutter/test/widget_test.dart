import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mother/data/content.dart';
import 'package:mother/data/profile.dart';
import 'package:mother/l10n/language.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final today = DateTime(2026, 10, 15);

  test('son adetten hafta hesabı', () {
    final lmp = today.subtract(const Duration(days: 20 * 7 + 3));
    final p = Pregnancy.fromDueDate(lmp.add(const Duration(days: 280)), today: today);
    expect(p.week, 20);
    expect(p.dayOfWeek, 3);
    expect(p.daysLeft, 280 - 143);
    expect(p.trimester, 2);
  });

  test('tahmini doğum tarihi geçmişse 40. haftada kalır', () {
    final p = Pregnancy.fromDueDate(today.subtract(const Duration(days: 5)), today: today);
    expect(p.daysPassed, 280);
    expect(p.daysLeft, 0);
    expect(p.week, 40);
  });

  test('çok erken tarih eksiye düşmez', () {
    final p = Pregnancy.fromDueDate(today.add(const Duration(days: 400)), today: today);
    expect(p.daysPassed, 0);
    expect(p.week, 0);
  });

  test('Türkçe içerik', () async {
    await AppContent.load('tr');
    final c = AppContent.current;
    expect(AppContent.weekImage(2), 'assets/weeks/dortweekfetus.jpg');
    expect(AppContent.weekImage(20), 'assets/weeks/yirminci.jpg');
    expect(c.babySize(20), 'Bebeğiniz muz büyüklüğünde');
    expect(c.babySize(2), isNull);
    expect(c.listItems('tests').length, 22);
    for (final who in ['baby', 'mother']) {
      for (final day in [0, 1, 54, 140, 280, 300]) {
        expect(c.dailyInfo(who, day), isNotEmpty, reason: '$who gün $day');
      }
    }
    expect(c.randomName(girl: true), isNotNull);
    expect(c.randomName(girl: false), isNotNull);
  });

  // Her dilin içerik dosyaları Türkçe ile aynı yapıda olmalı: hazır listelerin
  // sırası/grupları veritabanında kod olarak saklandığı için birebir eşleşmeli.
  test('tüm dillerin içerik dosyaları tutarlı', () {
    Map<String, dynamic> read(String lang, String kind) =>
        jsonDecode(File('assets/content/$lang.$kind.json').readAsStringSync()) as Map<String, dynamic>;
    final tr = read('tr', 'static');
    for (final lang in languages.keys) {
      final file = File('assets/content/$lang.static.json');
      if (!file.existsSync()) continue;
      final s = read(lang, 'static');
      expect((s['sizes'] as Map).keys.toSet(), (tr['sizes'] as Map).keys.toSet(), reason: '$lang sizes');
      for (final list in ['needs', 'bag', 'tests']) {
        final a = tr[list] as List, b = s[list] as List;
        expect(b.length, a.length, reason: '$lang $list sayısı');
        for (var i = 0; i < a.length; i++) {
          expect((b[i] as List)[0], (a[i] as List)[0], reason: '$lang $list[$i] grubu');
          expect(((b[i] as List)[1] as String).trim(), isNotEmpty, reason: '$lang $list[$i]');
        }
        expect(((s['groups'] as Map)[list] as Map).keys.toSet(), ((tr['groups'] as Map)[list] as Map).keys.toSet(),
            reason: '$lang $list grupları');
      }
      final namesFile = File('assets/content/$lang.names.json');
      if (namesFile.existsSync()) {
        final n = read(lang, 'names');
        expect((n['girls'] as List).length, greaterThan(50), reason: '$lang kız isimleri');
        expect((n['boys'] as List).length, greaterThan(50), reason: '$lang erkek isimleri');
      }
      final dailyFile = File('assets/content/$lang.daily.json');
      if (dailyFile.existsSync()) {
        final d = read(lang, 'daily');
        expect((d['baby'] as Map).length, 280, reason: '$lang bebek günleri');
        expect((d['mother'] as Map).length, greaterThanOrEqualTo(279), reason: '$lang anne günleri');
      }
    }
  });
}
