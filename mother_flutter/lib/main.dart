import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'data/profile.dart';
import 'l10n/app_localizations.dart';
import 'l10n/language.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'services/ads.dart';
import 'services/notifications.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDateFormatting();
  await LanguageController.instance.init();
  await Notifications.loadSettings();
  final profile = await Profile.load();
  runApp(BebegimApp(hasProfile: profile != null));
  Ads.start();
  Notifications.scheduleMilestones();
}

class BebegimApp extends StatelessWidget {
  const BebegimApp({super.key, required this.hasProfile});
  final bool hasProfile;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: LanguageController.instance,
      builder: (_, _, _) => MaterialApp(
        onGenerateTitle: (c) => L.of(c).appTitle,
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        locale: LanguageController.instance.locale,
        supportedLocales: L.supportedLocales,
        localizationsDelegates: const [
          L.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: hasProfile ? const HomeScreen() : const ProfileScreen(onboarding: true),
      ),
    );
  }
}
