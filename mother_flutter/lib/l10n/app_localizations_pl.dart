// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class LPl extends L {
  LPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Moje Dziecko';

  @override
  String get cancel => 'Anuluj';

  @override
  String get save => 'Zapisz';

  @override
  String get delete => 'Usuń';

  @override
  String get add => 'Dodaj';

  @override
  String get deleteAll => 'Usuń wszystko';

  @override
  String get saved => 'Zapisano';

  @override
  String get swipeToDelete => 'Przesuń w lewo, aby usunąć.';

  @override
  String get history => 'Historia';

  @override
  String get start => 'Start';

  @override
  String weekAxis(int week) {
    return '$week tydz.';
  }

  @override
  String get welcomeTitle => 'Witaj';

  @override
  String get welcomeSubtitle =>
      'Potrzebujemy kilku informacji, aby śledzić Twoją ciążę tydzień po tygodniu.';

  @override
  String get babyName => 'Imię dziecka';

  @override
  String get sexLabel => 'Płeć';

  @override
  String get sexGirl => 'Dziewczynka';

  @override
  String get sexBoy => 'Chłopiec';

  @override
  String get sexUnknown => 'Jeszcze nie wiadomo';

  @override
  String get kinLabel => 'Dla dziecka jesteś...';

  @override
  String get kinMother => 'Mamą';

  @override
  String get kinFather => 'Tatą';

  @override
  String get kinAuntMaternal => 'Ciocią (ze strony mamy)';

  @override
  String get kinAuntPaternal => 'Ciocią (ze strony taty)';

  @override
  String get kinUncleMaternal => 'Wujkiem (ze strony mamy)';

  @override
  String get kinUnclePaternal => 'Wujkiem (ze strony taty)';

  @override
  String get kinSibling => 'Rodzeństwem';

  @override
  String get kinGrandmother => 'Babcią';

  @override
  String get kinGrandfather => 'Dziadkiem';

  @override
  String get kinOther => 'Krewnym';

  @override
  String get whichDate => 'Którą datę znasz?';

  @override
  String get lastPeriod => 'Ostatnia miesiączka';

  @override
  String get dueDateShort => 'Termin porodu';

  @override
  String get lastPeriodLong => 'Pierwszy dzień ostatniej miesiączki';

  @override
  String get dueDateLong => 'Przewidywany termin porodu';

  @override
  String get tapToSelect => 'Dotknij, aby wybrać';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Termin porodu: $date · $week. tydzień, $day. dzień';
  }

  @override
  String get begin => 'Zaczynamy';

  @override
  String get nameRequired => 'Wpisz imię (lub przezwisko) dziecka.';

  @override
  String get dateRequired => 'Wybierz datę.';

  @override
  String get settings => 'Ustawienia';

  @override
  String get language => 'Język';

  @override
  String get languageSystem => 'Język telefonu';

  @override
  String get privacyOptions => 'Opcje prywatności reklam';

  @override
  String get factoryReset => 'Usuń wszystkie dane';

  @override
  String get factoryResetTitle => 'Usuń wszystkie dane';

  @override
  String get factoryResetMessage =>
      'Wszystkie dane o wadze, lekach, licznikach, listach i zdjęciach zostaną usunięte. Na pewno?';

  @override
  String weekDay(int week, int day) {
    return '$week. tydzień, $day. dzień';
  }

  @override
  String trimester(int n) {
    return '$n. trymestr';
  }

  @override
  String get daysPassed => 'dni minęło';

  @override
  String get daysLeft => 'dni zostało';

  @override
  String get dueDate => 'termin porodu';

  @override
  String get babyToday => 'Dziecko dziś';

  @override
  String get motherToday => 'Mama dziś';

  @override
  String dailyBabyTitle(int week) {
    return 'Moje dziecko · $week. tydzień';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mama · $week. tydzień';
  }

  @override
  String get noInfoToday => 'Brak informacji na dziś.';

  @override
  String get ringBirth => 'Do porodu';

  @override
  String get ringTests => 'Badania';

  @override
  String get ringNeeds => 'Wyprawka';

  @override
  String get ringBag => 'Torba';

  @override
  String get weightChange => 'Zmiana wagi';

  @override
  String get tools => 'Narzędzia';

  @override
  String get toolWeight => 'Waga';

  @override
  String get toolMedicine => 'Leki';

  @override
  String get toolKick => 'Licznik ruchów';

  @override
  String get toolContraction => 'Skurcze';

  @override
  String get toolNeeds => 'Wyprawka dla dziecka';

  @override
  String get toolBag => 'Torba do szpitala';

  @override
  String get toolTests => 'Badania';

  @override
  String get toolNames => 'Wybór imienia';

  @override
  String get toolAlbum => 'Album zdjęć';

  @override
  String get suggest => 'Wyślij opinię';

  @override
  String get rate => 'Oceń';

  @override
  String get emailError => 'Nie udało się otworzyć aplikacji pocztowej.';

  @override
  String get suggestSubject => 'Opinia o aplikacji Moje Dziecko';

  @override
  String get suggestBody => 'Twoja sugestia:';

  @override
  String get weightStart => 'Twoja waga początkowa';

  @override
  String get weightToday => 'Twoja dzisiejsza waga';

  @override
  String get weightHint => 'np. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Dodaj wagę';

  @override
  String get weightClearTitle => 'Dane o wadze';

  @override
  String get weightClearMessage => 'Wszystkie pomiary wagi zostaną usunięte.';

  @override
  String get weightEmpty => 'Brak pomiarów. Wpisz wagę początkową, aby zacząć.';

  @override
  String totalChange(String value) {
    return 'Łączna zmiana: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week. tydzień · $date';
  }

  @override
  String get medAdd => 'Dodaj lek';

  @override
  String get medEmpty =>
      'Dodaj swoje leki – przypomnimy Ci o nich codziennie o wybranej godzinie.';

  @override
  String get medNew => 'Nowy lek';

  @override
  String get medEdit => 'Edytuj lek';

  @override
  String get medName => 'Nazwa leku';

  @override
  String get medTime => 'Godzina';

  @override
  String get medReminderOn => 'Przypomnienie włączone';

  @override
  String medDaily(String time, String meal) {
    return 'Codziennie $time · $meal';
  }

  @override
  String get mealEmpty => 'Na czczo';

  @override
  String get mealFull => 'Po posiłku';

  @override
  String get mealAny => 'Obojętnie';

  @override
  String notifTitle(String name) {
    return 'Lek: $name';
  }

  @override
  String get notifEmpty => 'Pamiętaj, by przyjąć go na czczo';

  @override
  String get notifFull => 'Pamiętaj, by przyjąć go po posiłku';

  @override
  String get notifAny => 'Czas na lek';

  @override
  String get notifChannel => 'Przypomnienie o lekach';

  @override
  String get notifChannelDesc => 'Przypomnienia o porach przyjmowania leków';

  @override
  String get notifPermissionDenied =>
      'Brak zgody na powiadomienia – przypomnienie nie zadzwoni.';

  @override
  String get kickIdle => 'ruchy';

  @override
  String get kickTap => 'KOPNIĘCIE!';

  @override
  String get stopAndSave => 'Zakończ i zapisz';

  @override
  String get kickHelp =>
      'Dotknij koła za każdym razem, gdy dziecko się poruszy. Ogólna wskazówka: 10 ruchów w ciągu 2 godzin. Jeśli coś Cię niepokoi, skontaktuj się z lekarzem.';

  @override
  String get kickEmpty => 'Brak zapisanych sesji.';

  @override
  String kickRow(int count, String duration) {
    return 'Ruchy: $count · $duration';
  }

  @override
  String get contractionRunning => 'Trwa skurcz';

  @override
  String get contractionIdle => 'Dotknij, gdy zacznie się skurcz';

  @override
  String get contractionStartBtn => 'POCZĄTEK';

  @override
  String get contractionStopBtn => 'KONIEC';

  @override
  String get contractionHelp =>
      'Jeśli skurcze są regularne i coraz częstsze (np. co 5 minut, trwające 1 minutę), skontaktuj się z lekarzem.';

  @override
  String get contractionEmpty => 'Brak zapisanych skurczów.';

  @override
  String contractionDuration(String duration) {
    return 'Czas trwania $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration od poprzedniego';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Ostatnia godzina: skurcze: $count · średnio $length, co $minutes min';
  }

  @override
  String progressLabel(int done, int total) {
    return 'Ukończono: $done / $total';
  }

  @override
  String get addItem => 'Dodaj pozycję';

  @override
  String get newItem => 'Nowa pozycja';

  @override
  String get customGroup => 'Moje pozycje';

  @override
  String get testsDisclaimer =>
      'Lista ma charakter wyłącznie informacyjny; o swój harmonogram badań zapytaj lekarza.';

  @override
  String get namesTitle => 'Imię dla dziecka';

  @override
  String get spinning => 'Koło się kręci…';

  @override
  String get namesHint => 'Dotknij koła lub potrząśnij telefonem';

  @override
  String get nameError => 'Nie udało się wylosować imienia.';

  @override
  String get shareAll => 'Udostępnij wszystkie';

  @override
  String get ultrasoundPhoto => 'Zdjęcie USG';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get pickGallery => 'Wybierz z galerii';

  @override
  String get share => 'Udostępnij';

  @override
  String get remove => 'Usuń';

  @override
  String get photoError => 'Nie udało się pobrać zdjęcia. Sprawdź uprawnienia.';

  @override
  String get addPhotosFirst => 'Najpierw dodaj zdjęcia do albumu.';

  @override
  String photoN(int n) {
    return 'Zdjęcie $n';
  }

  @override
  String get shareText => 'Zdjęcie USG mojego dziecka';

  @override
  String get shareAllText => 'Album USG mojego dziecka';

  @override
  String get chartBaby => 'Dziecko (szacunkowo)';

  @override
  String get chartMother => 'Mama';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Szacunkowa waga dziecka: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'Waga dziecka jest pokazywana od 8. tygodnia.';

  @override
  String get babyWeightNote =>
      'To wartości średnie; każde dziecko rośnie inaczej. Zapytaj lekarza.';

  @override
  String get babyBornQuestion => 'Czy dziecko już się urodziło? 🎉';

  @override
  String get babyBornAction => 'Moje dziecko się urodziło';

  @override
  String get babyBornTitle => 'Witaj, maleństwo!';

  @override
  String get birthDateLabel => 'Data urodzenia';

  @override
  String get birthWeight => 'Waga urodzeniowa (kg)';

  @override
  String get birthLength => 'Długość urodzeniowa (cm)';

  @override
  String get optional => 'opcjonalnie';

  @override
  String get backToPregnancy => 'Wróć do trybu ciąży';

  @override
  String get weeklyNotifSetting => 'Cotygodniowe powiadomienia';

  @override
  String get weeklyNotifChannel => 'Informacje tygodniowe';

  @override
  String weeklyNotifTitle(int week) {
    return 'Witaj w $week. tygodniu 💕';
  }

  @override
  String get weeklyNotifBody => 'Informacje na ten tydzień są gotowe.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name ma już $month mies.! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Zobacz rozwój w tym miesiącu.';

  @override
  String babyAge(int months, int days) {
    return '$months mies. $days dni';
  }

  @override
  String monthTitle(int month) {
    return 'Rozwój w $month. miesiącu';
  }

  @override
  String get newbornTitle => 'Okres noworodkowy';

  @override
  String get showMore => 'Czytaj dalej';

  @override
  String get lastFeeding => 'ostatnie karmienie';

  @override
  String get diapersToday => 'pieluchy dziś';

  @override
  String get sleepToday => 'sen dziś';

  @override
  String agoHM(int h, int m) {
    return '$h godz. $m min temu';
  }

  @override
  String agoM(int m) {
    return '$m min temu';
  }

  @override
  String durationHM(int h, int m) {
    return '$h godz. $m min';
  }

  @override
  String get toolFeeding => 'Karmienie';

  @override
  String get toolDiaper => 'Pieluchy';

  @override
  String get toolSleep => 'Sen';

  @override
  String get toolGrowth => 'Wzrost';

  @override
  String get breastLeft => 'Lewa';

  @override
  String get breastRight => 'Prawa';

  @override
  String get bottle => 'Butelka';

  @override
  String get solid => 'Rozszerzanie diety';

  @override
  String get tapToStop => 'Dotknij tej samej strony ponownie, aby zakończyć';

  @override
  String get bottleAmount => 'Ilość w butelce';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Dziś';

  @override
  String feedCount(int count) {
    return 'Karmienia: $count';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Pierś $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Butelka $ml ml';
  }

  @override
  String get diaperWet => 'Mokra';

  @override
  String get diaperDirty => 'Brudna';

  @override
  String get diaperBoth => 'Obie';

  @override
  String diaperCount(int count) {
    return 'Pieluchy: $count';
  }

  @override
  String get sleepStart => 'Zasnęło';

  @override
  String get sleepStop => 'Obudziło się';

  @override
  String get sleepRunning => 'Śpi';

  @override
  String sleepTotal(String duration) {
    return 'Razem dziś $duration';
  }

  @override
  String get growthAdd => 'Dodaj pomiar';

  @override
  String get growthWeight => 'Waga (kg)';

  @override
  String get growthLength => 'Długość (cm)';

  @override
  String get growthHead => 'Obwód głowy (cm)';

  @override
  String get growthHeadShort => 'Głowa';

  @override
  String get growthEmpty =>
      'Brak pomiarów. Dodaj wartości z wizyt kontrolnych.';

  @override
  String get whoMedian => 'Średnia WHO';

  @override
  String get babyWeightLabel => 'Waga dziecka';

  @override
  String monthAxis(int month) {
    return '$month mies.';
  }

  @override
  String get otherTools => 'Inne narzędzia';

  @override
  String get noRecords => 'Brak wpisów.';

  @override
  String get dailyMsgSetting => 'Poranne wiadomości';

  @override
  String get premiumTitle => 'Usuń reklamy';

  @override
  String get premiumDesc =>
      'Korzystaj z aplikacji bez reklam po jednorazowej płatności. Zakup obowiązuje też na innych urządzeniach z tym samym kontem.';

  @override
  String premiumBuy(String price) {
    return 'Bez reklam – $price';
  }

  @override
  String get premiumBuyNoPrice => 'Sklep jest teraz niedostępny';

  @override
  String get premiumRestore => 'Przywróć zakup';

  @override
  String get premiumActive =>
      'Wersja bez reklam jest aktywna. Dziękujemy za wsparcie 💕';

  @override
  String get premiumUnavailable =>
      'Nie udało się dokończyć zakupu. Spróbuj ponownie później.';

  @override
  String get premiumThanks => 'Dziękujemy! Nie zobaczysz już reklam 💕';
}
