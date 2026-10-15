import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

/// Dile bağlı içerik: hafta büyüklükleri, hazır listeler, günlük bebek/anne
/// bilgileri ve isimler. assets/content/{dil}.{static,daily,names}.json
/// dosyalarından okunur; bir dosya yoksa İngilizce, o da yoksa Türkçe kullanılır.
class AppContent {
  AppContent._(this.lang, this._static, this._daily, this._names, this._months, this._messages);

  final String lang;
  final Map<String, dynamic> _static;
  final Map<String, dynamic> _daily;
  final Map<String, dynamic> _names;
  final Map<String, dynamic> _months;
  final Map<String, dynamic> _messages;

  static AppContent? _current;
  static AppContent get current => _current!;

  static Future<void> load(String lang) async {
    if (_current?.lang == lang) return;
    _current = AppContent._(
      lang,
      await _file(lang, 'static'),
      await _file(lang, 'daily'),
      await _file(lang, 'names'),
      await _file(lang, 'months'),
      await _file(lang, 'messages'),
    );
  }

  static Future<Map<String, dynamic>> _file(String lang, String kind) async {
    for (final l in [lang, 'en', 'tr']) {
      try {
        final s = await rootBundle.loadString('assets/content/$l.$kind.json');
        return jsonDecode(s) as Map<String, dynamic>;
      } catch (_) {}
    }
    return {};
  }

  // ---- Hafta görselleri (dilden bağımsız) ----

  static const _weekImages = <int, String>{
    5: 'besinci', 6: 'altinci', 7: 'yedinci', 8: 'sekizinci', 9: 'dokuzuncu',
    10: 'onuncu', 11: 'onbirinci', 12: 'onikinci', 13: 'onucuncu', 14: 'ondorduncu',
    15: 'onbesinci', 16: 'onaltinci', 17: 'onyedinci', 18: 'onsekizinci', 19: 'ondokuzuncu',
    20: 'yirminci', 21: 'yirmibir', 22: 'yirmiiki', 23: 'yirmiuc', 24: 'yirmidort',
    25: 'yirmibes', 26: 'yirmialti', 27: 'yirmiyedi', 28: 'yirmisekiz', 29: 'yirmidokuz',
    30: 'otuz', 31: 'otuzbir', 32: 'otuziki', 33: 'otuzuc', 34: 'otuzdort',
    35: 'otuzbes', 36: 'otuzalti', 37: 'otuzyedi', 38: 'otuzsekiz', 39: 'otuzdokuz',
    40: 'kirik',
  };

  static String weekImage(int week) =>
      'assets/weeks/${_weekImages[week.clamp(4, 40)] ?? 'dortweekfetus'}.jpg';

  // ---- Statik içerik ----

  /// Örn. "Bebeğiniz muz büyüklüğünde"; ilk haftalarda null.
  String? babySize(int week) => (_static['sizes'] as Map<String, dynamic>?)?['${week.clamp(0, 40)}'] as String?;

  /// Hazır liste maddeleri: (grup anahtarı, başlık). [list]: needs, bag, tests.
  List<(String, String)> listItems(String list) {
    final raw = (_static[list] as List<dynamic>?) ?? const [];
    return [for (final e in raw) ((e as List<dynamic>)[0] as String, e[1] as String)];
  }

  String groupName(String list, String group) =>
      ((_static['groups'] as Map<String, dynamic>?)?[list] as Map<String, dynamic>?)?[group] as String? ?? group;

  String itemTitle(String list, int index) {
    final items = listItems(list);
    return index >= 0 && index < items.length ? items[index].$2 : '';
  }

  // ---- Günlük bilgiler ----

  /// Eski uygulamadaki gün eşlemesi: geçen gün sayısı - 1 (1..280).
  /// Metin "✦" ile ayrılmış maddeler olarak döner.
  List<String> dailyInfo(String who, int daysPassed) {
    final days = (_daily[who] as Map<String, dynamic>?) ?? const {};
    final start = (daysPassed - 1).clamp(1, 280);
    String? text;
    for (var d = start; d >= 1 && text == null; d--) {
      text = days['$d'] as String?;
    }
    for (var d = start; d <= 280 && text == null; d++) {
      text = days['$d'] as String?;
    }
    return (text ?? '').split('✦').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }

  // ---- Doğum sonrası aylık gelişim (0–12. ay) ----

  List<String> monthInfo(int month) {
    final text = _months['${month.clamp(0, 12)}'] as String? ?? '';
    return text.split('✦').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }

  // ---- Günlük motivasyon mesajları ----

  /// Hitap: "Günaydın anne", "Günaydın baba" veya genel.
  String greeting(String kin) {
    final key = switch (kin) { 'mother' => 'greetMother', 'father' => 'greetFather', _ => 'greetOther' };
    return _messages[key] as String? ?? '';
  }

  /// [day] gün numarasına göre sıradaki mesaj ({baby} yerine bebeğin adı).
  String? dailyMessage({required bool born, required int day, required String babyName}) {
    final list = (_messages[born ? 'baby' : 'pregnancy'] as List<dynamic>?) ?? const [];
    if (list.isEmpty) return null;
    return (list[day % list.length] as String).replaceAll('{baby}', babyName);
  }

  // ---- İsimler ----

  (String, String)? randomName({required bool girl}) {
    final list = (_names[girl ? 'girls' : 'boys'] as List<dynamic>?) ?? const [];
    if (list.isEmpty) return null;
    final e = list[Random().nextInt(list.length)] as Map<String, dynamic>;
    return (e['n'] as String, (e['m'] as String?) ?? '');
  }
}
