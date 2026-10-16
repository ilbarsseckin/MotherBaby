// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class LNl extends L {
  LNl([String locale = 'nl']) : super(locale);

  @override
  String weekN(int week) {
    return 'Week $week';
  }

  @override
  String get appTitle => 'Mijn Baby';

  @override
  String get cancel => 'Annuleren';

  @override
  String get save => 'Opslaan';

  @override
  String get delete => 'Verwijderen';

  @override
  String get add => 'Toevoegen';

  @override
  String get deleteAll => 'Alles verwijderen';

  @override
  String get saved => 'Opgeslagen';

  @override
  String get swipeToDelete => 'Veeg naar links om te verwijderen.';

  @override
  String get history => 'Geschiedenis';

  @override
  String get start => 'Start';

  @override
  String weekAxis(int week) {
    return 'wk $week';
  }

  @override
  String get welcomeTitle => 'Welkom';

  @override
  String get welcomeSubtitle =>
      'We hebben een paar gegevens nodig om je zwangerschap week na week te volgen.';

  @override
  String get babyName => 'Naam van de baby';

  @override
  String get sexLabel => 'Geslacht';

  @override
  String get sexGirl => 'Meisje';

  @override
  String get sexBoy => 'Jongen';

  @override
  String get sexUnknown => 'Nog niet bekend';

  @override
  String get kinLabel => 'Voor de baby ben je...';

  @override
  String get kinMother => 'Moeder';

  @override
  String get kinFather => 'Vader';

  @override
  String get kinAuntMaternal => 'Tante (moederskant)';

  @override
  String get kinAuntPaternal => 'Tante (vaderskant)';

  @override
  String get kinUncleMaternal => 'Oom (moederskant)';

  @override
  String get kinUnclePaternal => 'Oom (vaderskant)';

  @override
  String get kinSibling => 'Broer of zus';

  @override
  String get kinGrandmother => 'Oma';

  @override
  String get kinGrandfather => 'Opa';

  @override
  String get kinOther => 'Familielid';

  @override
  String get whichDate => 'Welke datum weet je?';

  @override
  String get lastPeriod => 'Laatste menstruatie';

  @override
  String get dueDateShort => 'Uitgerekende datum';

  @override
  String get lastPeriodLong => 'Eerste dag van de laatste menstruatie';

  @override
  String get dueDateLong => 'Uitgerekende datum';

  @override
  String get tapToSelect => 'Tik om te kiezen';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Uitgerekend: $date · week $week, dag $day';
  }

  @override
  String get begin => 'Beginnen';

  @override
  String get nameRequired => 'Vul een naam (of bijnaam) voor je baby in.';

  @override
  String get dateRequired => 'Kies de datum.';

  @override
  String get settings => 'Instellingen';

  @override
  String get language => 'Taal';

  @override
  String get languageSystem => 'Taal van de telefoon';

  @override
  String get privacyOptions => 'Privacyopties voor advertenties';

  @override
  String get factoryReset => 'Alle gegevens wissen';

  @override
  String get factoryResetTitle => 'Alle gegevens wissen';

  @override
  String get factoryResetMessage =>
      'Al je gegevens over gewicht, medicijnen, tellers, lijsten en foto\'s worden verwijderd. Weet je het zeker?';

  @override
  String weekDay(int week, int day) {
    return 'Week $week, dag $day';
  }

  @override
  String trimester(int n) {
    return '${n}e trimester';
  }

  @override
  String get daysPassed => 'dagen voorbij';

  @override
  String get daysLeft => 'dagen te gaan';

  @override
  String get dueDate => 'uitgerekend';

  @override
  String get babyToday => 'Mijn baby vandaag';

  @override
  String get motherToday => 'Mama vandaag';

  @override
  String dailyBabyTitle(int week) {
    return 'Mijn baby · week $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mama · week $week';
  }

  @override
  String get noInfoToday => 'Geen informatie gevonden voor vandaag.';

  @override
  String get ringBirth => 'Tot de geboorte';

  @override
  String get ringTests => 'Onderzoeken';

  @override
  String get ringNeeds => 'Uitzet';

  @override
  String get ringBag => 'Tas';

  @override
  String get weightChange => 'Gewichtsverloop';

  @override
  String get tools => 'Hulpmiddelen';

  @override
  String get toolWeight => 'Gewicht';

  @override
  String get toolMedicine => 'Medicijnen';

  @override
  String get toolKick => 'Schopjes tellen';

  @override
  String get toolContraction => 'Weeëntimer';

  @override
  String get toolNeeds => 'Babyuitzet';

  @override
  String get toolBag => 'Bevallingstas';

  @override
  String get toolTests => 'Onderzoeken';

  @override
  String get toolNames => 'Namen zoeken';

  @override
  String get toolAlbum => 'Fotoalbum';

  @override
  String get suggest => 'Feedback sturen';

  @override
  String get rate => 'Beoordelen';

  @override
  String get emailError => 'Er kon geen e-mailapp worden geopend.';

  @override
  String get suggestSubject => 'Feedback over de app Mijn Baby';

  @override
  String get suggestBody => 'Jouw suggestie:';

  @override
  String get weightStart => 'Je startgewicht';

  @override
  String get weightToday => 'Je gewicht vandaag';

  @override
  String get weightHint => 'bijv. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Gewicht toevoegen';

  @override
  String get weightClearTitle => 'Gewichtsgegevens';

  @override
  String get weightClearMessage => 'Al je gewichtsmetingen worden verwijderd.';

  @override
  String get weightEmpty =>
      'Nog geen metingen. Vul je startgewicht in om te beginnen.';

  @override
  String totalChange(String value) {
    return 'Totale verandering: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Week $week · $date';
  }

  @override
  String get medAdd => 'Medicijn toevoegen';

  @override
  String get medEmpty =>
      'Voeg je medicijnen toe; we herinneren je er elke dag op het gekozen tijdstip aan.';

  @override
  String get medNew => 'Nieuw medicijn';

  @override
  String get medEdit => 'Medicijn bewerken';

  @override
  String get medName => 'Naam van het medicijn';

  @override
  String get medTime => 'Tijd';

  @override
  String get medReminderOn => 'Herinnering aan';

  @override
  String medDaily(String time, String meal) {
    return 'Elke dag $time · $meal';
  }

  @override
  String get mealEmpty => 'Op een lege maag';

  @override
  String get mealFull => 'Na het eten';

  @override
  String get mealAny => 'Maakt niet uit';

  @override
  String notifTitle(String name) {
    return 'Medicijn: $name';
  }

  @override
  String get notifEmpty => 'Vergeet niet het op een lege maag in te nemen';

  @override
  String get notifFull => 'Vergeet niet het na het eten in te nemen';

  @override
  String get notifAny => 'Tijd voor je medicijn';

  @override
  String get notifChannel => 'Medicijnherinnering';

  @override
  String get notifChannelDesc => 'Herinneringen op innametijden';

  @override
  String get notifPermissionDenied =>
      'Geen toestemming voor meldingen; de herinnering gaat niet af.';

  @override
  String get kickIdle => 'schopjes';

  @override
  String get kickTap => 'SCHOP!';

  @override
  String get stopAndSave => 'Stoppen en opslaan';

  @override
  String get kickHelp =>
      'Tik op de cirkel telkens als je baby beweegt. Algemene richtlijn: 10 bewegingen binnen 2 uur. Maak je je zorgen, neem dan contact op met je verloskundige of arts.';

  @override
  String get kickEmpty => 'Geen opgeslagen sessies.';

  @override
  String kickRow(int count, String duration) {
    return '$count schopjes · $duration';
  }

  @override
  String get contractionRunning => 'Wee bezig';

  @override
  String get contractionIdle => 'Tik wanneer een wee begint';

  @override
  String get contractionStartBtn => 'BEGIN';

  @override
  String get contractionStopBtn => 'EINDE';

  @override
  String get contractionHelp =>
      'Zijn de weeën regelmatig en komen ze steeds sneller (bijv. elke 5 minuten, 1 minuut lang), neem dan contact op met je verloskundige of arts.';

  @override
  String get contractionEmpty => 'Geen opgeslagen weeën.';

  @override
  String contractionDuration(String duration) {
    return 'Duur $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration sinds de vorige';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Afgelopen uur: $count weeën · gemiddeld $length lang, elke $minutes minuten';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total klaar';
  }

  @override
  String get addItem => 'Item toevoegen';

  @override
  String get newItem => 'Nieuw item';

  @override
  String get customGroup => 'Mijn items';

  @override
  String get testsDisclaimer =>
      'Deze lijst is alleen ter algemene informatie; vraag je arts of verloskundige naar jouw persoonlijke onderzoeksschema.';

  @override
  String get namesTitle => 'Naam voor mijn baby';

  @override
  String get spinning => 'Het rad draait…';

  @override
  String get namesHint => 'Tik op het rad of schud je telefoon';

  @override
  String get nameError => 'Er kon geen naam worden opgehaald.';

  @override
  String get shareAll => 'Alles delen';

  @override
  String get ultrasoundPhoto => 'Echofoto';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get pickGallery => 'Kiezen uit galerij';

  @override
  String get share => 'Delen';

  @override
  String get remove => 'Verwijderen';

  @override
  String get photoError =>
      'De foto kon niet worden opgehaald. Controleer de machtigingen.';

  @override
  String get addPhotosFirst => 'Voeg eerst foto\'s toe aan het album.';

  @override
  String photoN(int n) {
    return 'Foto $n';
  }

  @override
  String get shareText => 'De echofoto van mijn baby';

  @override
  String get shareAllText => 'Het echoalbum van mijn baby';

  @override
  String get chartBaby => 'Baby (geschat)';

  @override
  String get chartMother => 'Mama';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Geschat gewicht van de baby: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'Het gewicht van de baby wordt vanaf week 8 getoond.';

  @override
  String get babyWeightNote =>
      'Dit zijn gemiddelden; elke baby groeit anders. Vraag je verloskundige of arts.';

  @override
  String get babyBornQuestion => 'Is je baby geboren? 🎉';

  @override
  String get babyBornAction => 'Mijn baby is geboren';

  @override
  String get babyBornTitle => 'Welkom, kleintje!';

  @override
  String get birthDateLabel => 'Geboortedatum';

  @override
  String get birthWeight => 'Geboortegewicht (kg)';

  @override
  String get birthLength => 'Geboortelengte (cm)';

  @override
  String get optional => 'optioneel';

  @override
  String get backToPregnancy => 'Terug naar zwangerschapsmodus';

  @override
  String get weeklyNotifSetting => 'Wekelijkse meldingen';

  @override
  String get weeklyNotifChannel => 'Wekelijkse info';

  @override
  String weeklyNotifTitle(int week) {
    return 'Welkom in week $week 💕';
  }

  @override
  String get weeklyNotifBody => 'De info van deze week staat klaar.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name is $month maanden oud! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Bekijk de ontwikkeling van deze maand.';

  @override
  String babyAge(int months, int days) {
    return '$months mnd $days d';
  }

  @override
  String monthTitle(int month) {
    return 'Ontwikkeling maand $month';
  }

  @override
  String get newbornTitle => 'Pasgeboren periode';

  @override
  String get showMore => 'Lees meer';

  @override
  String get lastFeeding => 'laatste voeding';

  @override
  String get diapersToday => 'luiers vandaag';

  @override
  String get sleepToday => 'slaap vandaag';

  @override
  String agoHM(int h, int m) {
    return '$h u $m min geleden';
  }

  @override
  String agoM(int m) {
    return '$m min geleden';
  }

  @override
  String durationHM(int h, int m) {
    return '$h u $m min';
  }

  @override
  String get toolFeeding => 'Voeding';

  @override
  String get toolDiaper => 'Luiers';

  @override
  String get toolSleep => 'Slaap';

  @override
  String get toolGrowth => 'Groei';

  @override
  String get breastLeft => 'Links';

  @override
  String get breastRight => 'Rechts';

  @override
  String get bottle => 'Fles';

  @override
  String get solid => 'Vast voedsel';

  @override
  String get tapToStop => 'Tik nogmaals op dezelfde kant om te stoppen';

  @override
  String get bottleAmount => 'Hoeveelheid fles';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Vandaag';

  @override
  String feedCount(int count) {
    return '$count voedingen';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Borstvoeding $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Fles $ml ml';
  }

  @override
  String get diaperWet => 'Nat';

  @override
  String get diaperDirty => 'Vies';

  @override
  String get diaperBoth => 'Allebei';

  @override
  String diaperCount(int count) {
    return '$count luiers';
  }

  @override
  String get sleepStart => 'In slaap';

  @override
  String get sleepStop => 'Wakker';

  @override
  String get sleepRunning => 'Slaapt';

  @override
  String sleepTotal(String duration) {
    return 'Totaal vandaag $duration';
  }

  @override
  String get growthAdd => 'Meting toevoegen';

  @override
  String get growthWeight => 'Gewicht (kg)';

  @override
  String get growthLength => 'Lengte (cm)';

  @override
  String get growthHead => 'Hoofdomtrek (cm)';

  @override
  String get growthHeadShort => 'Hoofd';

  @override
  String get growthEmpty =>
      'Nog geen metingen. Voeg de waarden van controles toe.';

  @override
  String get whoMedian => 'WHO-gemiddelde';

  @override
  String get babyWeightLabel => 'Gewicht van de baby';

  @override
  String monthAxis(int month) {
    return '$month mnd';
  }

  @override
  String get otherTools => 'Andere hulpmiddelen';

  @override
  String get noRecords => 'Nog geen gegevens.';

  @override
  String get dailyMsgSetting => 'Goedemorgenberichten';

  @override
  String get premiumTitle => 'Advertenties verwijderen';

  @override
  String get premiumDesc =>
      'Gebruik de app zonder advertenties met een eenmalige betaling. De aankoop geldt ook op je andere apparaten met hetzelfde store-account.';

  @override
  String premiumBuy(String price) {
    return 'Advertentievrij – $price';
  }

  @override
  String get premiumBuyNoPrice => 'De store is nu niet beschikbaar';

  @override
  String get premiumRestore => 'Aankoop herstellen';

  @override
  String get premiumActive =>
      'De advertentievrije versie is actief. Bedankt voor je steun 💕';

  @override
  String get premiumUnavailable =>
      'De aankoop kon niet worden voltooid. Probeer het later opnieuw.';

  @override
  String get premiumThanks => 'Bedankt! Je ziet geen advertenties meer 💕';
}
