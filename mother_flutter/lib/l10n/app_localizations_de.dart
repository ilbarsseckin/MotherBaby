// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class LDe extends L {
  LDe([String locale = 'de']) : super(locale);

  @override
  String weekN(int week) {
    return 'Woche $week';
  }

  @override
  String get appTitle => 'Mein Baby';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get deleteAll => 'Alle löschen';

  @override
  String get saved => 'Gespeichert';

  @override
  String get swipeToDelete => 'Zum Löschen nach links wischen.';

  @override
  String get history => 'Verlauf';

  @override
  String get start => 'Start';

  @override
  String weekAxis(int week) {
    return 'SSW $week';
  }

  @override
  String get welcomeTitle => 'Willkommen';

  @override
  String get welcomeSubtitle =>
      'Wir brauchen ein paar Angaben, um deine Schwangerschaft Woche für Woche zu begleiten.';

  @override
  String get babyName => 'Name des Babys';

  @override
  String get sexLabel => 'Geschlecht';

  @override
  String get sexGirl => 'Mädchen';

  @override
  String get sexBoy => 'Junge';

  @override
  String get sexUnknown => 'Noch unbekannt';

  @override
  String get kinLabel => 'Du bist für das Baby...';

  @override
  String get kinMother => 'Mutter';

  @override
  String get kinFather => 'Vater';

  @override
  String get kinAuntMaternal => 'Tante (mütterlicherseits)';

  @override
  String get kinAuntPaternal => 'Tante (väterlicherseits)';

  @override
  String get kinUncleMaternal => 'Onkel (mütterlicherseits)';

  @override
  String get kinUnclePaternal => 'Onkel (väterlicherseits)';

  @override
  String get kinSibling => 'Geschwister';

  @override
  String get kinGrandmother => 'Großmutter';

  @override
  String get kinGrandfather => 'Großvater';

  @override
  String get kinOther => 'Angehörige(r)';

  @override
  String get whichDate => 'Welches Datum kennst du?';

  @override
  String get lastPeriod => 'Letzte Periode';

  @override
  String get dueDateShort => 'Geburtstermin';

  @override
  String get lastPeriodLong => 'Erster Tag der letzten Periode';

  @override
  String get dueDateLong => 'Errechneter Geburtstermin';

  @override
  String get tapToSelect => 'Zum Auswählen tippen';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Geburtstermin: $date · SSW $week, Tag $day';
  }

  @override
  String get begin => 'Los geht\'s';

  @override
  String get nameRequired =>
      'Bitte gib einen Namen (oder Spitznamen) für dein Baby ein.';

  @override
  String get dateRequired => 'Bitte wähle das Datum aus.';

  @override
  String get settings => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'Telefonsprache';

  @override
  String get privacyOptions => 'Datenschutzoptionen für Werbung';

  @override
  String get factoryReset => 'Alle Daten zurücksetzen';

  @override
  String get factoryResetTitle => 'Alle Daten zurücksetzen';

  @override
  String get factoryResetMessage =>
      'Alle Gewichts-, Medikamenten-, Zähler-, Listen- und Fotodaten werden gelöscht. Bist du sicher?';

  @override
  String weekDay(int week, int day) {
    return 'SSW $week, Tag $day';
  }

  @override
  String trimester(int n) {
    return '$n. Trimester';
  }

  @override
  String get daysPassed => 'Tage vergangen';

  @override
  String get daysLeft => 'Tage übrig';

  @override
  String get dueDate => 'Geburtstermin';

  @override
  String get babyToday => 'Mein Baby heute';

  @override
  String get motherToday => 'Mama heute';

  @override
  String dailyBabyTitle(int week) {
    return 'Mein Baby · SSW $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mama · SSW $week';
  }

  @override
  String get noInfoToday => 'Für heute wurden keine Informationen gefunden.';

  @override
  String get ringBirth => 'Bis zur Geburt';

  @override
  String get ringTests => 'Tests';

  @override
  String get ringNeeds => 'Ausstattung';

  @override
  String get ringBag => 'Kliniktasche';

  @override
  String get weightChange => 'Gewichtsverlauf';

  @override
  String get tools => 'Werkzeuge';

  @override
  String get toolWeight => 'Gewicht';

  @override
  String get toolMedicine => 'Medikamente';

  @override
  String get toolKick => 'Tritte zählen';

  @override
  String get toolContraction => 'Wehen-Timer';

  @override
  String get toolNeeds => 'Babyausstattung';

  @override
  String get toolBag => 'Kliniktasche';

  @override
  String get toolTests => 'Untersuchungen';

  @override
  String get toolNames => 'Namensfinder';

  @override
  String get toolAlbum => 'Fotoalbum';

  @override
  String get suggest => 'Feedback senden';

  @override
  String get rate => 'Bewerten';

  @override
  String get emailError => 'Es konnte keine E-Mail-App geöffnet werden.';

  @override
  String get suggestSubject => 'Feedback zur App „Mein Baby“';

  @override
  String get suggestBody => 'Dein Vorschlag:';

  @override
  String get weightStart => 'Dein Ausgangsgewicht';

  @override
  String get weightToday => 'Dein heutiges Gewicht';

  @override
  String get weightHint => 'z. B. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Gewicht eintragen';

  @override
  String get weightClearTitle => 'Gewichtsdaten';

  @override
  String get weightClearMessage =>
      'Alle deine Gewichtseinträge werden gelöscht.';

  @override
  String get weightEmpty =>
      'Noch keine Einträge. Trage dein Ausgangsgewicht ein, um zu beginnen.';

  @override
  String totalChange(String value) {
    return 'Gesamtveränderung: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'SSW $week · $date';
  }

  @override
  String get medAdd => 'Medikament hinzufügen';

  @override
  String get medEmpty =>
      'Füge deine Medikamente hinzu – wir erinnern dich jeden Tag zur gewählten Uhrzeit.';

  @override
  String get medNew => 'Neues Medikament';

  @override
  String get medEdit => 'Medikament bearbeiten';

  @override
  String get medName => 'Name des Medikaments';

  @override
  String get medTime => 'Uhrzeit';

  @override
  String get medReminderOn => 'Erinnerung an';

  @override
  String medDaily(String time, String meal) {
    return 'Täglich $time · $meal';
  }

  @override
  String get mealEmpty => 'Nüchtern';

  @override
  String get mealFull => 'Nach dem Essen';

  @override
  String get mealAny => 'Egal';

  @override
  String notifTitle(String name) {
    return 'Medikament: $name';
  }

  @override
  String get notifEmpty => 'Denk daran, es nüchtern einzunehmen';

  @override
  String get notifFull => 'Denk daran, es nach dem Essen einzunehmen';

  @override
  String get notifAny => 'Zeit für dein Medikament';

  @override
  String get notifChannel => 'Medikamenten-Erinnerung';

  @override
  String get notifChannelDesc => 'Erinnerungen zu den Einnahmezeiten';

  @override
  String get notifPermissionDenied =>
      'Keine Benachrichtigungsberechtigung – die Erinnerung wird nicht ausgelöst.';

  @override
  String get kickIdle => 'Tritte';

  @override
  String get kickTap => 'TRITT!';

  @override
  String get stopAndSave => 'Beenden und speichern';

  @override
  String get kickHelp =>
      'Tippe jedes Mal auf den Kreis, wenn sich dein Baby bewegt. Faustregel: 10 Bewegungen in 2 Stunden. Wenn du dir Sorgen machst, sprich mit deiner Ärztin oder deinem Arzt.';

  @override
  String get kickEmpty => 'Keine gespeicherten Sitzungen.';

  @override
  String kickRow(int count, String duration) {
    return '$count Tritte · $duration';
  }

  @override
  String get contractionRunning => 'Wehe läuft';

  @override
  String get contractionIdle => 'Tippe, wenn eine Wehe beginnt';

  @override
  String get contractionStartBtn => 'BEGINN';

  @override
  String get contractionStopBtn => 'ENDE';

  @override
  String get contractionHelp =>
      'Wenn die Wehen regelmäßig sind und häufiger werden (z. B. alle 5 Minuten, je 1 Minute lang), wende dich an deine Ärztin, deinen Arzt oder deine Hebamme.';

  @override
  String get contractionEmpty => 'Keine gespeicherten Wehen.';

  @override
  String contractionDuration(String duration) {
    return 'Dauer $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'Abstand zur vorherigen $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Letzte Stunde: $count Wehen · im Schnitt $length lang, alle $minutes Minuten';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total erledigt';
  }

  @override
  String get addItem => 'Eintrag hinzufügen';

  @override
  String get newItem => 'Neuer Eintrag';

  @override
  String get customGroup => 'Meine Einträge';

  @override
  String get testsDisclaimer =>
      'Diese Liste dient nur der allgemeinen Information; deinen persönlichen Untersuchungsplan bespricht deine Ärztin oder dein Arzt mit dir.';

  @override
  String get namesTitle => 'Name für mein Baby';

  @override
  String get spinning => 'Das Rad dreht sich…';

  @override
  String get namesHint => 'Tippe auf das Rad oder schüttle dein Handy';

  @override
  String get nameError => 'Es konnte kein Name geladen werden.';

  @override
  String get shareAll => 'Alle teilen';

  @override
  String get ultrasoundPhoto => 'Ultraschallbild';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get pickGallery => 'Aus der Galerie wählen';

  @override
  String get share => 'Teilen';

  @override
  String get remove => 'Entfernen';

  @override
  String get photoError =>
      'Das Foto konnte nicht geladen werden. Bitte prüfe die Berechtigungen.';

  @override
  String get addPhotosFirst => 'Füge zuerst Fotos zum Album hinzu.';

  @override
  String photoN(int n) {
    return 'Foto $n';
  }

  @override
  String get shareText => 'Ultraschallbild meines Babys';

  @override
  String get shareAllText => 'Ultraschallalbum meines Babys';

  @override
  String get chartBaby => 'Baby (geschätzt)';

  @override
  String get chartMother => 'Mama';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Geschätztes Gewicht des Babys: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'Das Gewicht des Babys wird ab Woche 8 angezeigt.';

  @override
  String get babyWeightNote =>
      'Durchschnittswerte; jedes Baby entwickelt sich anders. Genaues weiß deine Ärztin.';

  @override
  String get babyBornQuestion => 'Ist dein Baby da? 🎉';

  @override
  String get babyBornAction => 'Mein Baby ist da';

  @override
  String get babyBornTitle => 'Willkommen, Kleines!';

  @override
  String get birthDateLabel => 'Geburtsdatum';

  @override
  String get birthWeight => 'Geburtsgewicht (kg)';

  @override
  String get birthLength => 'Geburtslänge (cm)';

  @override
  String get optional => 'optional';

  @override
  String get backToPregnancy => 'Zurück zum Schwangerschaftsmodus';

  @override
  String get weeklyNotifSetting => 'Wöchentliche Benachrichtigungen';

  @override
  String get weeklyNotifChannel => 'Wöchentliche Infos';

  @override
  String weeklyNotifTitle(int week) {
    return 'Willkommen in SSW $week 💕';
  }

  @override
  String get weeklyNotifBody => 'Die Infos dieser Woche sind da.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name ist $month Monate alt! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Schau dir die Entwicklung dieses Monats an.';

  @override
  String babyAge(int months, int days) {
    return '$months Mon. $days T.';
  }

  @override
  String monthTitle(int month) {
    return 'Entwicklung im $month. Monat';
  }

  @override
  String get newbornTitle => 'Neugeborenenzeit';

  @override
  String get showMore => 'Weiterlesen';

  @override
  String get lastFeeding => 'letzte Mahlzeit';

  @override
  String get diapersToday => 'Windeln heute';

  @override
  String get sleepToday => 'Schlaf heute';

  @override
  String agoHM(int h, int m) {
    return 'vor $h Std. $m Min.';
  }

  @override
  String agoM(int m) {
    return 'vor $m Min.';
  }

  @override
  String durationHM(int h, int m) {
    return '$h Std. $m Min.';
  }

  @override
  String get toolFeeding => 'Füttern';

  @override
  String get toolDiaper => 'Windeln';

  @override
  String get toolSleep => 'Schlaf';

  @override
  String get toolGrowth => 'Wachstum';

  @override
  String get breastLeft => 'Links';

  @override
  String get breastRight => 'Rechts';

  @override
  String get bottle => 'Fläschchen';

  @override
  String get solid => 'Beikost';

  @override
  String get tapToStop => 'Zum Beenden dieselbe Seite erneut tippen';

  @override
  String get bottleAmount => 'Fläschchenmenge';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Heute';

  @override
  String feedCount(int count) {
    return '$count Mahlzeiten';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Stillen $minutes Min.';
  }

  @override
  String bottleTotal(int ml) {
    return 'Fläschchen $ml ml';
  }

  @override
  String get diaperWet => 'Nass';

  @override
  String get diaperDirty => 'Voll';

  @override
  String get diaperBoth => 'Beides';

  @override
  String diaperCount(int count) {
    return '$count Windeln';
  }

  @override
  String get sleepStart => 'Eingeschlafen';

  @override
  String get sleepStop => 'Aufgewacht';

  @override
  String get sleepRunning => 'Schläft';

  @override
  String sleepTotal(String duration) {
    return 'Heute gesamt $duration';
  }

  @override
  String get growthAdd => 'Messung hinzufügen';

  @override
  String get growthWeight => 'Gewicht (kg)';

  @override
  String get growthLength => 'Länge (cm)';

  @override
  String get growthHead => 'Kopfumfang (cm)';

  @override
  String get growthHeadShort => 'Kopf';

  @override
  String get growthEmpty =>
      'Noch keine Messungen. Trag die Werte von den Vorsorgeuntersuchungen ein.';

  @override
  String get whoMedian => 'WHO-Durchschnitt';

  @override
  String get babyWeightLabel => 'Gewicht des Babys';

  @override
  String monthAxis(int month) {
    return '$month Mon.';
  }

  @override
  String get otherTools => 'Weitere Werkzeuge';

  @override
  String get noRecords => 'Noch keine Einträge.';

  @override
  String get dailyMsgSetting => 'Guten-Morgen-Nachrichten';

  @override
  String get premiumTitle => 'Werbung entfernen';

  @override
  String get premiumDesc =>
      'Nutze die App mit einer einmaligen Zahlung werbefrei. Der Kauf gilt auch auf deinen anderen Geräten mit demselben Store-Konto.';

  @override
  String premiumBuy(String price) {
    return 'Werbefrei – $price';
  }

  @override
  String get premiumBuyNoPrice => 'Der Store ist gerade nicht verfügbar';

  @override
  String get premiumRestore => 'Kauf wiederherstellen';

  @override
  String get premiumActive =>
      'Die werbefreie Version ist aktiv. Danke für deine Unterstützung 💕';

  @override
  String get premiumUnavailable =>
      'Der Kauf konnte nicht abgeschlossen werden. Bitte versuch es später erneut.';

  @override
  String get premiumThanks => 'Danke! Du siehst ab jetzt keine Werbung mehr 💕';
}
