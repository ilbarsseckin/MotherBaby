import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/content.dart';

/// Desteklenen diller ve kendi dillerindeki adları.
const languages = <String, String>{
  'tr': 'Türkçe',
  'en': 'English',
  'de': 'Deutsch',
  'fr': 'Français',
  'it': 'Italiano',
  'nl': 'Nederlands',
  'es': 'Español',
  'pt': 'Português',
  'ru': 'Русский',
  'uk': 'Українська',
  'pl': 'Polski',
  'ar': 'العربية',
  'fa': 'فارسی',
  'ur': 'اردو',
  'hi': 'हिन्दी',
  'zh': '中文',
  'ja': '日本語',
  'ko': '한국어',
  'id': 'Bahasa Indonesia',
  'az': 'Azərbaycanca',
};

/// Seçili dil. null = telefonun dili (desteklenmiyorsa İngilizce).
class LanguageController extends ValueNotifier<String?> {
  LanguageController._() : super(null);
  static final instance = LanguageController._();

  static const _key = 'language';

  /// Gerçekte kullanılan dil kodu.
  String get effective {
    final v = value;
    if (v != null && languages.containsKey(v)) return v;
    final device = PlatformDispatcher.instance.locale.languageCode;
    return languages.containsKey(device) ? device : 'en';
  }

  Locale get locale => Locale(effective);

  Future<void> init() async {
    final p = await SharedPreferences.getInstance();
    value = p.getString(_key);
    await AppContent.load(effective);
  }

  Future<void> set(String? code) async {
    final p = await SharedPreferences.getInstance();
    if (code == null) {
      await p.remove(_key);
    } else {
      await p.setString(_key, code);
    }
    await AppContent.load(code ?? _deviceOrEnglish());
    value = code;
  }

  static String _deviceOrEnglish() {
    final device = PlatformDispatcher.instance.locale.languageCode;
    return languages.containsKey(device) ? device : 'en';
  }
}
