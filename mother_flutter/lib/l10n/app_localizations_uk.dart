// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class LUk extends L {
  LUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Моє малятко';

  @override
  String get cancel => 'Скасувати';

  @override
  String get save => 'Зберегти';

  @override
  String get delete => 'Видалити';

  @override
  String get add => 'Додати';

  @override
  String get deleteAll => 'Видалити все';

  @override
  String get saved => 'Збережено';

  @override
  String get swipeToDelete => 'Проведіть ліворуч, щоб видалити.';

  @override
  String get history => 'Історія';

  @override
  String get start => 'Старт';

  @override
  String weekAxis(int week) {
    return '$week тиж.';
  }

  @override
  String get welcomeTitle => 'Ласкаво просимо';

  @override
  String get welcomeSubtitle =>
      'Нам потрібно кілька даних, щоб стежити за вашою вагітністю тиждень за тижнем.';

  @override
  String get babyName => 'Ім\'я малятка';

  @override
  String get sexLabel => 'Стать';

  @override
  String get sexGirl => 'Дівчинка';

  @override
  String get sexBoy => 'Хлопчик';

  @override
  String get sexUnknown => 'Поки невідомо';

  @override
  String get kinLabel => 'Ким ви доводитеся малятку?';

  @override
  String get kinMother => 'Мама';

  @override
  String get kinFather => 'Тато';

  @override
  String get kinAuntMaternal => 'Тітка (по мамі)';

  @override
  String get kinAuntPaternal => 'Тітка (по татові)';

  @override
  String get kinUncleMaternal => 'Дядько (по мамі)';

  @override
  String get kinUnclePaternal => 'Дядько (по татові)';

  @override
  String get kinSibling => 'Брат або сестра';

  @override
  String get kinGrandmother => 'Бабуся';

  @override
  String get kinGrandfather => 'Дідусь';

  @override
  String get kinOther => 'Родич';

  @override
  String get whichDate => 'Яку дату ви знаєте?';

  @override
  String get lastPeriod => 'Остання менструація';

  @override
  String get dueDateShort => 'Дата пологів';

  @override
  String get lastPeriodLong => 'Перший день останньої менструації';

  @override
  String get dueDateLong => 'Передбачувана дата пологів';

  @override
  String get tapToSelect => 'Торкніться, щоб вибрати';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Дата пологів: $date · $week тиждень, $day день';
  }

  @override
  String get begin => 'Почати';

  @override
  String get nameRequired => 'Введіть ім\'я (або прізвисько) малятка.';

  @override
  String get dateRequired => 'Виберіть дату.';

  @override
  String get settings => 'Налаштування';

  @override
  String get language => 'Мова';

  @override
  String get languageSystem => 'Мова телефону';

  @override
  String get privacyOptions => 'Налаштування конфіденційності реклами';

  @override
  String get factoryReset => 'Скинути всі дані';

  @override
  String get factoryResetTitle => 'Скинути всі дані';

  @override
  String get factoryResetMessage =>
      'Усі дані про вагу, ліки, лічильники, списки та фото буде видалено. Ви впевнені?';

  @override
  String weekDay(int week, int day) {
    return '$week тиждень, $day день';
  }

  @override
  String trimester(int n) {
    return '$n-й триместр';
  }

  @override
  String get daysPassed => 'днів минуло';

  @override
  String get daysLeft => 'днів залишилося';

  @override
  String get dueDate => 'дата пологів';

  @override
  String get babyToday => 'Малятко сьогодні';

  @override
  String get motherToday => 'Мама сьогодні';

  @override
  String dailyBabyTitle(int week) {
    return 'Моє малятко · $week тиждень';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Мама · $week тиждень';
  }

  @override
  String get noInfoToday => 'На сьогодні інформації немає.';

  @override
  String get ringBirth => 'До пологів';

  @override
  String get ringTests => 'Аналізи';

  @override
  String get ringNeeds => 'Покупки';

  @override
  String get ringBag => 'Сумка';

  @override
  String get weightChange => 'Зміна ваги';

  @override
  String get tools => 'Інструменти';

  @override
  String get toolWeight => 'Вага';

  @override
  String get toolMedicine => 'Ліки';

  @override
  String get toolKick => 'Лічильник поштовхів';

  @override
  String get toolContraction => 'Перейми';

  @override
  String get toolNeeds => 'Покупки для малятка';

  @override
  String get toolBag => 'Сумка в пологовий';

  @override
  String get toolTests => 'Аналізи та обстеження';

  @override
  String get toolNames => 'Вибір імені';

  @override
  String get toolAlbum => 'Фотоальбом';

  @override
  String get suggest => 'Надіслати відгук';

  @override
  String get rate => 'Оцінити';

  @override
  String get emailError => 'Не вдалося відкрити поштовий застосунок.';

  @override
  String get suggestSubject => 'Відгук про застосунок «Моє малятко»';

  @override
  String get suggestBody => 'Ваша пропозиція:';

  @override
  String get weightStart => 'Ваша початкова вага';

  @override
  String get weightToday => 'Ваша вага сьогодні';

  @override
  String get weightHint => 'напр. 62,5';

  @override
  String get kg => 'кг';

  @override
  String get weightAdd => 'Додати вагу';

  @override
  String get weightClearTitle => 'Дані про вагу';

  @override
  String get weightClearMessage => 'Усі записи про вагу буде видалено.';

  @override
  String get weightEmpty =>
      'Записів поки немає. Введіть початкову вагу, щоб почати.';

  @override
  String totalChange(String value) {
    return 'Загалом: $value кг';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week тиждень · $date';
  }

  @override
  String get medAdd => 'Додати ліки';

  @override
  String get medEmpty =>
      'Додайте ліки — ми нагадуватимемо щодня у вибраний час.';

  @override
  String get medNew => 'Нові ліки';

  @override
  String get medEdit => 'Змінити ліки';

  @override
  String get medName => 'Назва ліків';

  @override
  String get medTime => 'Час';

  @override
  String get medReminderOn => 'Нагадування увімкнено';

  @override
  String medDaily(String time, String meal) {
    return 'Щодня $time · $meal';
  }

  @override
  String get mealEmpty => 'Натщесерце';

  @override
  String get mealFull => 'Після їжі';

  @override
  String get mealAny => 'Неважливо';

  @override
  String notifTitle(String name) {
    return 'Ліки: $name';
  }

  @override
  String get notifEmpty => 'Не забудьте прийняти натщесерце';

  @override
  String get notifFull => 'Не забудьте прийняти після їжі';

  @override
  String get notifAny => 'Час прийняти ліки';

  @override
  String get notifChannel => 'Нагадування про ліки';

  @override
  String get notifChannelDesc => 'Нагадування в години прийому';

  @override
  String get notifPermissionDenied =>
      'Немає дозволу на сповіщення — нагадування не спрацює.';

  @override
  String get kickIdle => 'поштовхи';

  @override
  String get kickTap => 'ПОШТОВХ!';

  @override
  String get stopAndSave => 'Завершити й зберегти';

  @override
  String get kickHelp =>
      'Торкайтеся кола щоразу, коли малятко рухається. Загальний орієнтир: 10 рухів за 2 години. Якщо щось турбує, зверніться до лікаря.';

  @override
  String get kickEmpty => 'Немає збережених сеансів.';

  @override
  String kickRow(int count, String duration) {
    return 'Поштовхів: $count · $duration';
  }

  @override
  String get contractionRunning => 'Триває перейма';

  @override
  String get contractionIdle => 'Торкніться, коли почнеться перейма';

  @override
  String get contractionStartBtn => 'ПОЧАЛАСЯ';

  @override
  String get contractionStopBtn => 'ЗАКІНЧИЛАСЯ';

  @override
  String get contractionHelp =>
      'Якщо перейми регулярні й частішають (наприклад, кожні 5 хвилин по 1 хвилині), зверніться до лікаря.';

  @override
  String get contractionEmpty => 'Немає збережених перейм.';

  @override
  String contractionDuration(String duration) {
    return 'Тривалість $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'інтервал $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'За останню годину перейм: $count · у середньому по $length, кожні $minutes хв';
  }

  @override
  String progressLabel(int done, int total) {
    return 'Виконано: $done з $total';
  }

  @override
  String get addItem => 'Додати пункт';

  @override
  String get newItem => 'Новий пункт';

  @override
  String get customGroup => 'Мої пункти';

  @override
  String get testsDisclaimer =>
      'Список має загальний інформаційний характер; індивідуальний графік обстежень уточніть у лікаря.';

  @override
  String get namesTitle => 'Ім\'я для малятка';

  @override
  String get spinning => 'Колесо крутиться…';

  @override
  String get namesHint => 'Торкніться колеса або струсніть телефон';

  @override
  String get nameError => 'Не вдалося підібрати ім\'я.';

  @override
  String get shareAll => 'Поділитися всіма';

  @override
  String get ultrasoundPhoto => 'Знімок УЗД';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get pickGallery => 'Вибрати з галереї';

  @override
  String get share => 'Поділитися';

  @override
  String get remove => 'Прибрати';

  @override
  String get photoError => 'Не вдалося отримати фото. Перевірте дозволи.';

  @override
  String get addPhotosFirst => 'Спочатку додайте фото до альбому.';

  @override
  String photoN(int n) {
    return 'Фото $n';
  }

  @override
  String get shareText => 'Знімок УЗД мого малятка';

  @override
  String get shareAllText => 'Альбом УЗД мого малятка';

  @override
  String get chartBaby => 'Малятко (орієнтовно)';

  @override
  String get chartMother => 'Мама';

  @override
  String get gram => 'г';

  @override
  String babyWeightNow(String value) {
    return 'Орієнтовна вага малятка: $value';
  }

  @override
  String get babyWeightTooEarly => 'Вага малятка показується з 8-го тижня.';

  @override
  String get babyWeightNote =>
      'Це середні значення; кожне малятко росте по-своєму. Уточнюйте в лікаря.';

  @override
  String get babyBornQuestion => 'Малятко вже народилося? 🎉';

  @override
  String get babyBornAction => 'Моє малятко народилося';

  @override
  String get babyBornTitle => 'Ласкаво просимо, малятко!';

  @override
  String get birthDateLabel => 'Дата народження';

  @override
  String get birthWeight => 'Вага при народженні (кг)';

  @override
  String get birthLength => 'Зріст при народженні (см)';

  @override
  String get optional => 'необов\'язково';

  @override
  String get backToPregnancy => 'Повернутися до режиму вагітності';

  @override
  String get weeklyNotifSetting => 'Щотижневі сповіщення';

  @override
  String get weeklyNotifChannel => 'Щотижневі новини';

  @override
  String weeklyNotifTitle(int week) {
    return 'Почався $week тиждень 💕';
  }

  @override
  String get weeklyNotifBody => 'Інформація на цей тиждень готова.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name вже $month міс.! 🎉';
  }

  @override
  String get monthlyNotifBody =>
      'Подивіться, як малятко розвивається цього місяця.';

  @override
  String babyAge(int months, int days) {
    return '$months міс. $days дн.';
  }

  @override
  String monthTitle(int month) {
    return 'Розвиток: $month-й місяць';
  }

  @override
  String get newbornTitle => 'Період новонародженості';

  @override
  String get showMore => 'Докладніше';

  @override
  String get lastFeeding => 'останнє годування';

  @override
  String get diapersToday => 'підгузків сьогодні';

  @override
  String get sleepToday => 'сон сьогодні';

  @override
  String agoHM(int h, int m) {
    return '$h год $m хв тому';
  }

  @override
  String agoM(int m) {
    return '$m хв тому';
  }

  @override
  String durationHM(int h, int m) {
    return '$h год $m хв';
  }

  @override
  String get toolFeeding => 'Годування';

  @override
  String get toolDiaper => 'Підгузки';

  @override
  String get toolSleep => 'Сон';

  @override
  String get toolGrowth => 'Зріст і вага';

  @override
  String get breastLeft => 'Ліва';

  @override
  String get breastRight => 'Права';

  @override
  String get bottle => 'Пляшечка';

  @override
  String get solid => 'Прикорм';

  @override
  String get tapToStop => 'Торкніться тієї ж сторони ще раз, щоб завершити';

  @override
  String get bottleAmount => 'Об\'єм пляшечки';

  @override
  String get ml => 'мл';

  @override
  String get todaySummary => 'Сьогодні';

  @override
  String feedCount(int count) {
    return 'Годувань: $count';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Груди $minutes хв';
  }

  @override
  String bottleTotal(int ml) {
    return 'Пляшечка $ml мл';
  }

  @override
  String get diaperWet => 'Мокрий';

  @override
  String get diaperDirty => 'Брудний';

  @override
  String get diaperBoth => 'Обидва';

  @override
  String diaperCount(int count) {
    return 'Підгузків: $count';
  }

  @override
  String get sleepStart => 'Заснуло';

  @override
  String get sleepStop => 'Прокинулося';

  @override
  String get sleepRunning => 'Спить';

  @override
  String sleepTotal(String duration) {
    return 'Усього сьогодні $duration';
  }

  @override
  String get growthAdd => 'Додати вимір';

  @override
  String get growthWeight => 'Вага (кг)';

  @override
  String get growthLength => 'Зріст (см)';

  @override
  String get growthHead => 'Обвід голови (см)';

  @override
  String get growthHeadShort => 'Голова';

  @override
  String get growthEmpty => 'Вимірів поки немає. Додайте дані з оглядів.';

  @override
  String get whoMedian => 'Середнє за ВООЗ';

  @override
  String get babyWeightLabel => 'Вага малятка';

  @override
  String monthAxis(int month) {
    return '$month міс.';
  }

  @override
  String get otherTools => 'Інші інструменти';

  @override
  String get noRecords => 'Записів поки немає.';

  @override
  String get dailyMsgSetting => 'Ранкові повідомлення';
}
