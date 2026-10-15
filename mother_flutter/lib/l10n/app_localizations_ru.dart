// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LRu extends L {
  LRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Мой малыш';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get add => 'Добавить';

  @override
  String get deleteAll => 'Удалить всё';

  @override
  String get saved => 'Сохранено';

  @override
  String get swipeToDelete => 'Смахните влево, чтобы удалить.';

  @override
  String get history => 'История';

  @override
  String get start => 'Старт';

  @override
  String weekAxis(int week) {
    return '$week нед.';
  }

  @override
  String get welcomeTitle => 'Добро пожаловать';

  @override
  String get welcomeSubtitle =>
      'Нам нужно несколько данных, чтобы следить за вашей беременностью неделя за неделей.';

  @override
  String get babyName => 'Имя малыша';

  @override
  String get sexLabel => 'Пол';

  @override
  String get sexGirl => 'Девочка';

  @override
  String get sexBoy => 'Мальчик';

  @override
  String get sexUnknown => 'Пока неизвестно';

  @override
  String get kinLabel => 'Кем вы приходитесь малышу?';

  @override
  String get kinMother => 'Мама';

  @override
  String get kinFather => 'Папа';

  @override
  String get kinAuntMaternal => 'Тётя (по маме)';

  @override
  String get kinAuntPaternal => 'Тётя (по папе)';

  @override
  String get kinUncleMaternal => 'Дядя (по маме)';

  @override
  String get kinUnclePaternal => 'Дядя (по папе)';

  @override
  String get kinSibling => 'Брат или сестра';

  @override
  String get kinGrandmother => 'Бабушка';

  @override
  String get kinGrandfather => 'Дедушка';

  @override
  String get kinOther => 'Родственник';

  @override
  String get whichDate => 'Какую дату вы знаете?';

  @override
  String get lastPeriod => 'Последние месячные';

  @override
  String get dueDateShort => 'Дата родов';

  @override
  String get lastPeriodLong => 'Первый день последних месячных';

  @override
  String get dueDateLong => 'Предполагаемая дата родов';

  @override
  String get tapToSelect => 'Нажмите, чтобы выбрать';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Дата родов: $date · $week неделя, $day день';
  }

  @override
  String get begin => 'Начать';

  @override
  String get nameRequired => 'Введите имя (или прозвище) малыша.';

  @override
  String get dateRequired => 'Выберите дату.';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get languageSystem => 'Язык телефона';

  @override
  String get privacyOptions => 'Настройки конфиденциальности рекламы';

  @override
  String get factoryReset => 'Сбросить все данные';

  @override
  String get factoryResetTitle => 'Сбросить все данные';

  @override
  String get factoryResetMessage =>
      'Все данные о весе, лекарствах, счётчиках, списках и фото будут удалены. Вы уверены?';

  @override
  String weekDay(int week, int day) {
    return '$week неделя, $day день';
  }

  @override
  String trimester(int n) {
    return '$n-й триместр';
  }

  @override
  String get daysPassed => 'дней прошло';

  @override
  String get daysLeft => 'дней осталось';

  @override
  String get dueDate => 'дата родов';

  @override
  String get babyToday => 'Малыш сегодня';

  @override
  String get motherToday => 'Мама сегодня';

  @override
  String dailyBabyTitle(int week) {
    return 'Мой малыш · $week неделя';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Мама · $week неделя';
  }

  @override
  String get noInfoToday => 'На сегодня информации нет.';

  @override
  String get ringBirth => 'До родов';

  @override
  String get ringTests => 'Анализы';

  @override
  String get ringNeeds => 'Покупки';

  @override
  String get ringBag => 'Сумка';

  @override
  String get weightChange => 'Изменение веса';

  @override
  String get tools => 'Инструменты';

  @override
  String get toolWeight => 'Вес';

  @override
  String get toolMedicine => 'Лекарства';

  @override
  String get toolKick => 'Счётчик шевелений';

  @override
  String get toolContraction => 'Схватки';

  @override
  String get toolNeeds => 'Покупки для малыша';

  @override
  String get toolBag => 'Сумка в роддом';

  @override
  String get toolTests => 'Анализы и обследования';

  @override
  String get toolNames => 'Выбор имени';

  @override
  String get toolAlbum => 'Фотоальбом';

  @override
  String get suggest => 'Отправить отзыв';

  @override
  String get rate => 'Оценить';

  @override
  String get emailError => 'Не удалось открыть почтовое приложение.';

  @override
  String get suggestSubject => 'Отзыв о приложении «Мой малыш»';

  @override
  String get suggestBody => 'Ваше предложение:';

  @override
  String get weightStart => 'Ваш начальный вес';

  @override
  String get weightToday => 'Ваш вес сегодня';

  @override
  String get weightHint => 'напр. 62,5';

  @override
  String get kg => 'кг';

  @override
  String get weightAdd => 'Добавить вес';

  @override
  String get weightClearTitle => 'Данные о весе';

  @override
  String get weightClearMessage => 'Все записи о весе будут удалены.';

  @override
  String get weightEmpty =>
      'Записей пока нет. Введите начальный вес, чтобы начать.';

  @override
  String totalChange(String value) {
    return 'Всего: $value кг';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week неделя · $date';
  }

  @override
  String get medAdd => 'Добавить лекарство';

  @override
  String get medEmpty =>
      'Добавьте лекарства — мы будем напоминать каждый день в выбранное время.';

  @override
  String get medNew => 'Новое лекарство';

  @override
  String get medEdit => 'Изменить лекарство';

  @override
  String get medName => 'Название лекарства';

  @override
  String get medTime => 'Время';

  @override
  String get medReminderOn => 'Напоминание включено';

  @override
  String medDaily(String time, String meal) {
    return 'Каждый день $time · $meal';
  }

  @override
  String get mealEmpty => 'Натощак';

  @override
  String get mealFull => 'После еды';

  @override
  String get mealAny => 'Неважно';

  @override
  String notifTitle(String name) {
    return 'Лекарство: $name';
  }

  @override
  String get notifEmpty => 'Не забудьте принять натощак';

  @override
  String get notifFull => 'Не забудьте принять после еды';

  @override
  String get notifAny => 'Пора принять лекарство';

  @override
  String get notifChannel => 'Напоминание о лекарствах';

  @override
  String get notifChannelDesc => 'Напоминания в часы приёма';

  @override
  String get notifPermissionDenied =>
      'Нет разрешения на уведомления — напоминание не сработает.';

  @override
  String get kickIdle => 'шевеления';

  @override
  String get kickTap => 'ТОЛЧОК!';

  @override
  String get stopAndSave => 'Завершить и сохранить';

  @override
  String get kickHelp =>
      'Нажимайте на круг каждый раз, когда малыш шевелится. Общий ориентир: 10 шевелений за 2 часа. Если что-то беспокоит, обратитесь к врачу.';

  @override
  String get kickEmpty => 'Нет сохранённых сеансов.';

  @override
  String kickRow(int count, String duration) {
    return 'Шевелений: $count · $duration';
  }

  @override
  String get contractionRunning => 'Идёт схватка';

  @override
  String get contractionIdle => 'Нажмите, когда начнётся схватка';

  @override
  String get contractionStartBtn => 'НАЧАЛАСЬ';

  @override
  String get contractionStopBtn => 'ЗАКОНЧИЛАСЬ';

  @override
  String get contractionHelp =>
      'Если схватки регулярные и учащаются (например, каждые 5 минут по 1 минуте), обратитесь к врачу.';

  @override
  String get contractionEmpty => 'Нет сохранённых схваток.';

  @override
  String contractionDuration(String duration) {
    return 'Длительность $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'интервал $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'За последний час схваток: $count · в среднем по $length, каждые $minutes мин';
  }

  @override
  String progressLabel(int done, int total) {
    return 'Готово: $done из $total';
  }

  @override
  String get addItem => 'Добавить пункт';

  @override
  String get newItem => 'Новый пункт';

  @override
  String get customGroup => 'Мои пункты';

  @override
  String get testsDisclaimer =>
      'Список носит общий информационный характер; индивидуальный график обследований уточните у врача.';

  @override
  String get namesTitle => 'Имя для малыша';

  @override
  String get spinning => 'Колесо крутится…';

  @override
  String get namesHint => 'Нажмите на колесо или встряхните телефон';

  @override
  String get nameError => 'Не удалось подобрать имя.';

  @override
  String get shareAll => 'Поделиться всеми';

  @override
  String get ultrasoundPhoto => 'Снимок УЗИ';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get pickGallery => 'Выбрать из галереи';

  @override
  String get share => 'Поделиться';

  @override
  String get remove => 'Убрать';

  @override
  String get photoError => 'Не удалось получить фото. Проверьте разрешения.';

  @override
  String get addPhotosFirst => 'Сначала добавьте фото в альбом.';

  @override
  String photoN(int n) {
    return 'Фото $n';
  }

  @override
  String get shareText => 'Снимок УЗИ моего малыша';

  @override
  String get shareAllText => 'Альбом УЗИ моего малыша';

  @override
  String get chartBaby => 'Малыш (примерно)';

  @override
  String get chartMother => 'Мама';

  @override
  String get gram => 'г';

  @override
  String babyWeightNow(String value) {
    return 'Примерный вес малыша: $value';
  }

  @override
  String get babyWeightTooEarly => 'Вес малыша показывается с 8-й недели.';

  @override
  String get babyWeightNote =>
      'Это средние значения; каждый малыш растёт по-своему. Уточняйте у врача.';

  @override
  String get babyBornQuestion => 'Малыш уже родился? 🎉';

  @override
  String get babyBornAction => 'Мой малыш родился';

  @override
  String get babyBornTitle => 'Добро пожаловать, малыш!';

  @override
  String get birthDateLabel => 'Дата рождения';

  @override
  String get birthWeight => 'Вес при рождении (кг)';

  @override
  String get birthLength => 'Рост при рождении (см)';

  @override
  String get optional => 'необязательно';

  @override
  String get backToPregnancy => 'Вернуться в режим беременности';

  @override
  String get weeklyNotifSetting => 'Еженедельные уведомления';

  @override
  String get weeklyNotifChannel => 'Еженедельные новости';

  @override
  String weeklyNotifTitle(int week) {
    return 'Началась $week неделя 💕';
  }

  @override
  String get weeklyNotifBody => 'Информация на эту неделю готова.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name уже $month мес.! 🎉';
  }

  @override
  String get monthlyNotifBody =>
      'Посмотрите, как малыш развивается в этом месяце.';

  @override
  String babyAge(int months, int days) {
    return '$months мес. $days дн.';
  }

  @override
  String monthTitle(int month) {
    return 'Развитие: $month-й месяц';
  }

  @override
  String get newbornTitle => 'Период новорождённости';

  @override
  String get showMore => 'Подробнее';

  @override
  String get lastFeeding => 'последнее кормление';

  @override
  String get diapersToday => 'подгузников сегодня';

  @override
  String get sleepToday => 'сон сегодня';

  @override
  String agoHM(int h, int m) {
    return '$h ч $m мин назад';
  }

  @override
  String agoM(int m) {
    return '$m мин назад';
  }

  @override
  String durationHM(int h, int m) {
    return '$h ч $m мин';
  }

  @override
  String get toolFeeding => 'Кормление';

  @override
  String get toolDiaper => 'Подгузники';

  @override
  String get toolSleep => 'Сон';

  @override
  String get toolGrowth => 'Рост и вес';

  @override
  String get breastLeft => 'Левая';

  @override
  String get breastRight => 'Правая';

  @override
  String get bottle => 'Бутылочка';

  @override
  String get solid => 'Прикорм';

  @override
  String get tapToStop => 'Нажмите ту же сторону ещё раз, чтобы закончить';

  @override
  String get bottleAmount => 'Объём бутылочки';

  @override
  String get ml => 'мл';

  @override
  String get todaySummary => 'Сегодня';

  @override
  String feedCount(int count) {
    return 'Кормлений: $count';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Грудь $minutes мин';
  }

  @override
  String bottleTotal(int ml) {
    return 'Бутылочка $ml мл';
  }

  @override
  String get diaperWet => 'Мокрый';

  @override
  String get diaperDirty => 'Грязный';

  @override
  String get diaperBoth => 'Оба';

  @override
  String diaperCount(int count) {
    return 'Подгузников: $count';
  }

  @override
  String get sleepStart => 'Уснул';

  @override
  String get sleepStop => 'Проснулся';

  @override
  String get sleepRunning => 'Спит';

  @override
  String sleepTotal(String duration) {
    return 'Всего сегодня $duration';
  }

  @override
  String get growthAdd => 'Добавить измерение';

  @override
  String get growthWeight => 'Вес (кг)';

  @override
  String get growthLength => 'Рост (см)';

  @override
  String get growthHead => 'Окружность головы (см)';

  @override
  String get growthHeadShort => 'Голова';

  @override
  String get growthEmpty => 'Измерений пока нет. Добавьте данные с осмотров.';

  @override
  String get whoMedian => 'Среднее по ВОЗ';

  @override
  String get babyWeightLabel => 'Вес малыша';

  @override
  String monthAxis(int month) {
    return '$month мес.';
  }

  @override
  String get otherTools => 'Другие инструменты';

  @override
  String get noRecords => 'Записей пока нет.';

  @override
  String get dailyMsgSetting => 'Утренние сообщения';

  @override
  String get premiumTitle => 'Убрать рекламу';

  @override
  String get premiumDesc =>
      'Пользуйтесь приложением без рекламы после единоразовой оплаты. Покупка действует и на других ваших устройствах с тем же аккаунтом.';

  @override
  String premiumBuy(String price) {
    return 'Без рекламы – $price';
  }

  @override
  String get premiumBuyNoPrice => 'Магазин сейчас недоступен';

  @override
  String get premiumRestore => 'Восстановить покупку';

  @override
  String get premiumActive =>
      'Версия без рекламы активна. Спасибо за поддержку 💕';

  @override
  String get premiumUnavailable =>
      'Не удалось завершить покупку. Попробуйте позже.';

  @override
  String get premiumThanks => 'Спасибо! Рекламы больше не будет 💕';
}
