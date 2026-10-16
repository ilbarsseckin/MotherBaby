// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class LUr extends L {
  LUr([String locale = 'ur']) : super(locale);

  @override
  String weekN(int week) {
    return 'ہفتہ $week';
  }

  @override
  String get appTitle => 'میرا بچہ';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get delete => 'حذف کریں';

  @override
  String get add => 'شامل کریں';

  @override
  String get deleteAll => 'سب حذف کریں';

  @override
  String get saved => 'محفوظ ہو گیا';

  @override
  String get swipeToDelete => 'حذف کرنے کے لیے ایک طرف سوائپ کریں۔';

  @override
  String get history => 'تاریخچہ';

  @override
  String get start => 'شروع کریں';

  @override
  String weekAxis(int week) {
    return 'ہفتہ $week';
  }

  @override
  String get welcomeTitle => 'خوش آمدید';

  @override
  String get welcomeSubtitle =>
      'آپ کے حمل کو ہفتہ بہ ہفتہ دیکھنے کے لیے ہمیں چند معلومات درکار ہیں۔';

  @override
  String get babyName => 'بچے کا نام';

  @override
  String get sexLabel => 'جنس';

  @override
  String get sexGirl => 'بیٹی';

  @override
  String get sexBoy => 'بیٹا';

  @override
  String get sexUnknown => 'ابھی معلوم نہیں';

  @override
  String get kinLabel => 'بچے سے آپ کا رشتہ';

  @override
  String get kinMother => 'ماں';

  @override
  String get kinFather => 'باپ';

  @override
  String get kinAuntMaternal => 'خالہ';

  @override
  String get kinAuntPaternal => 'پھوپھی';

  @override
  String get kinUncleMaternal => 'ماموں';

  @override
  String get kinUnclePaternal => 'چچا';

  @override
  String get kinSibling => 'بہن یا بھائی';

  @override
  String get kinGrandmother => 'دادی / نانی';

  @override
  String get kinGrandfather => 'دادا / نانا';

  @override
  String get kinOther => 'رشتہ دار';

  @override
  String get whichDate => 'آپ کون سی تاریخ جانتی ہیں؟';

  @override
  String get lastPeriod => 'آخری ماہواری';

  @override
  String get dueDateShort => 'متوقع پیدائش';

  @override
  String get lastPeriodLong => 'آخری ماہواری کا پہلا دن';

  @override
  String get dueDateLong => 'پیدائش کی متوقع تاریخ';

  @override
  String get tapToSelect => 'منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String profilePreview(String date, int week, int day) {
    return 'متوقع پیدائش: $date · ہفتہ $week، دن $day';
  }

  @override
  String get begin => 'شروع کریں';

  @override
  String get nameRequired => 'براہِ کرم بچے کا نام (یا عرفیت) لکھیں۔';

  @override
  String get dateRequired => 'براہِ کرم تاریخ منتخب کریں۔';

  @override
  String get settings => 'ترتیبات';

  @override
  String get language => 'زبان';

  @override
  String get languageSystem => 'فون کی زبان';

  @override
  String get privacyOptions => 'اشتہارات کی رازداری کے اختیارات';

  @override
  String get factoryReset => 'تمام ڈیٹا حذف کریں';

  @override
  String get factoryResetTitle => 'تمام ڈیٹا حذف کریں';

  @override
  String get factoryResetMessage =>
      'وزن، دواؤں، کاؤنٹر، فہرستوں اور تصاویر کا تمام ڈیٹا حذف ہو جائے گا۔ کیا آپ کو یقین ہے؟';

  @override
  String weekDay(int week, int day) {
    return 'ہفتہ $week، دن $day';
  }

  @override
  String trimester(int n) {
    return 'سہ ماہی $n';
  }

  @override
  String get daysPassed => 'دن گزرے';

  @override
  String get daysLeft => 'دن باقی';

  @override
  String get dueDate => 'متوقع پیدائش';

  @override
  String get babyToday => 'میرا بچہ آج';

  @override
  String get motherToday => 'ماں آج';

  @override
  String dailyBabyTitle(int week) {
    return 'میرا بچہ · ہفتہ $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'ماں · ہفتہ $week';
  }

  @override
  String get noInfoToday => 'آج کے لیے کوئی معلومات نہیں ملی۔';

  @override
  String get ringBirth => 'پیدائش تک';

  @override
  String get ringTests => 'ٹیسٹ';

  @override
  String get ringNeeds => 'ضروریات';

  @override
  String get ringBag => 'بیگ';

  @override
  String get weightChange => 'وزن میں تبدیلی';

  @override
  String get tools => 'ٹولز';

  @override
  String get toolWeight => 'وزن کا ریکارڈ';

  @override
  String get toolMedicine => 'دواؤں کا ریکارڈ';

  @override
  String get toolKick => 'ککس گنیں';

  @override
  String get toolContraction => 'دردِ زہ ٹائمر';

  @override
  String get toolNeeds => 'بچے کی ضروریات';

  @override
  String get toolBag => 'ہسپتال کا بیگ';

  @override
  String get toolTests => 'طبی ٹیسٹ';

  @override
  String get toolNames => 'نام تلاش کریں';

  @override
  String get toolAlbum => 'فوٹو البم';

  @override
  String get suggest => 'تجویز بھیجیں';

  @override
  String get rate => 'ریٹنگ دیں';

  @override
  String get emailError => 'ای میل ایپ نہیں کھل سکی۔';

  @override
  String get suggestSubject => 'میرا بچہ ایپ کے لیے تجویز';

  @override
  String get suggestBody => 'آپ کی تجویز:';

  @override
  String get weightStart => 'آپ کا ابتدائی وزن';

  @override
  String get weightToday => 'آج آپ کا وزن';

  @override
  String get weightHint => 'مثلاً 62.5';

  @override
  String get kg => 'کلو';

  @override
  String get weightAdd => 'وزن شامل کریں';

  @override
  String get weightClearTitle => 'وزن کا ڈیٹا';

  @override
  String get weightClearMessage => 'وزن کے تمام ریکارڈ حذف ہو جائیں گے۔';

  @override
  String get weightEmpty =>
      'ابھی کوئی ریکارڈ نہیں۔ شروع کرنے کے لیے اپنا ابتدائی وزن درج کریں۔';

  @override
  String totalChange(String value) {
    return 'کل تبدیلی: $value کلو';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'ہفتہ $week · $date';
  }

  @override
  String get medAdd => 'دوا شامل کریں';

  @override
  String get medEmpty =>
      'اپنی دوائیں شامل کریں؛ ہم ہر روز آپ کے منتخب وقت پر یاد دلائیں گے۔';

  @override
  String get medNew => 'نئی دوا';

  @override
  String get medEdit => 'دوا میں ترمیم';

  @override
  String get medName => 'دوا کا نام';

  @override
  String get medTime => 'وقت';

  @override
  String get medReminderOn => 'یاددہانی آن';

  @override
  String medDaily(String time, String meal) {
    return 'روزانہ $time · $meal';
  }

  @override
  String get mealEmpty => 'خالی پیٹ';

  @override
  String get mealFull => 'کھانے کے بعد';

  @override
  String get mealAny => 'کوئی فرق نہیں';

  @override
  String notifTitle(String name) {
    return 'دوا: $name';
  }

  @override
  String get notifEmpty => 'خالی پیٹ لینا نہ بھولیں';

  @override
  String get notifFull => 'کھانے کے بعد لینا نہ بھولیں';

  @override
  String get notifAny => 'دوا لینے کا وقت';

  @override
  String get notifChannel => 'دوا کی یاددہانی';

  @override
  String get notifChannelDesc => 'دوا کے اوقات پر یاددہانی';

  @override
  String get notifPermissionDenied =>
      'اطلاعات کی اجازت نہیں ملی؛ یاددہانی نہیں بجے گی۔';

  @override
  String get kickIdle => 'ککس';

  @override
  String get kickTap => 'کک!';

  @override
  String get stopAndSave => 'ختم کریں اور محفوظ کریں';

  @override
  String get kickHelp =>
      'جب بھی بچہ حرکت کرے دائرے کو ٹیپ کریں۔ عمومی رہنمائی: 2 گھنٹوں میں 10 حرکات۔ پریشانی ہو تو اپنے ڈاکٹر سے رجوع کریں۔';

  @override
  String get kickEmpty => 'کوئی محفوظ سیشن نہیں۔';

  @override
  String kickRow(int count, String duration) {
    return '$count ککس · $duration';
  }

  @override
  String get contractionRunning => 'درد جاری ہے';

  @override
  String get contractionIdle => 'درد شروع ہو تو ٹیپ کریں';

  @override
  String get contractionStartBtn => 'شروع';

  @override
  String get contractionStopBtn => 'ختم';

  @override
  String get contractionHelp =>
      'اگر درد باقاعدہ اور قریب قریب ہوں (مثلاً ہر 5 منٹ بعد، 1 منٹ تک)، تو اپنے ڈاکٹر سے رابطہ کریں۔';

  @override
  String get contractionEmpty => 'کوئی محفوظ درد نہیں۔';

  @override
  String contractionDuration(String duration) {
    return 'دورانیہ $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'پچھلے سے وقفہ $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'پچھلا ایک گھنٹہ: $count درد · اوسط دورانیہ $length، ہر $minutes منٹ بعد';
  }

  @override
  String progressLabel(int done, int total) {
    return '$total میں سے $done مکمل';
  }

  @override
  String get addItem => 'آئٹم شامل کریں';

  @override
  String get newItem => 'نیا آئٹم';

  @override
  String get customGroup => 'میرے آئٹمز';

  @override
  String get testsDisclaimer =>
      'یہ فہرست صرف عمومی معلومات کے لیے ہے؛ اپنے ٹیسٹوں کا شیڈول اپنے ڈاکٹر سے پوچھیں۔';

  @override
  String get namesTitle => 'میرے بچے کا نام';

  @override
  String get spinning => 'پہیہ گھوم رہا ہے…';

  @override
  String get namesHint => 'پہیے کو ٹیپ کریں یا فون ہلائیں';

  @override
  String get nameError => 'نام نہیں مل سکا۔';

  @override
  String get shareAll => 'سب شیئر کریں';

  @override
  String get ultrasoundPhoto => 'الٹراساؤنڈ تصویر';

  @override
  String get takePhoto => 'تصویر کھینچیں';

  @override
  String get pickGallery => 'گیلری سے منتخب کریں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get remove => 'ہٹائیں';

  @override
  String get photoError => 'تصویر حاصل نہیں ہو سکی۔ اجازتیں چیک کریں۔';

  @override
  String get addPhotosFirst => 'پہلے البم میں تصاویر شامل کریں۔';

  @override
  String photoN(int n) {
    return 'تصویر $n';
  }

  @override
  String get shareText => 'میرے بچے کی الٹراساؤنڈ تصویر';

  @override
  String get shareAllText => 'میرے بچے کا الٹراساؤنڈ البم';

  @override
  String get chartBaby => 'بچہ (اندازاً)';

  @override
  String get chartMother => 'ماں';

  @override
  String get gram => 'گرام';

  @override
  String babyWeightNow(String value) {
    return 'بچے کا اندازاً وزن: $value';
  }

  @override
  String get babyWeightTooEarly => 'بچے کا وزن ہفتہ 8 سے دکھایا جاتا ہے۔';

  @override
  String get babyWeightNote =>
      'یہ اوسط قدریں ہیں؛ ہر بچہ مختلف بڑھتا ہے۔ اپنے ڈاکٹر سے پوچھیں۔';

  @override
  String get babyBornQuestion => 'کیا آپ کا بچہ پیدا ہو گیا؟ 🎉';

  @override
  String get babyBornAction => 'میرا بچہ پیدا ہو گیا';

  @override
  String get babyBornTitle => 'خوش آمدید ننھے!';

  @override
  String get birthDateLabel => 'تاریخ پیدائش';

  @override
  String get birthWeight => 'پیدائش کا وزن (کلو)';

  @override
  String get birthLength => 'پیدائش کا قد (سینٹی میٹر)';

  @override
  String get optional => 'اختیاری';

  @override
  String get backToPregnancy => 'حمل موڈ پر واپس جائیں';

  @override
  String get weeklyNotifSetting => 'ہفتہ وار اطلاعات';

  @override
  String get weeklyNotifChannel => 'ہفتہ وار معلومات';

  @override
  String weeklyNotifTitle(int week) {
    return 'ہفتہ $week میں خوش آمدید 💕';
  }

  @override
  String get weeklyNotifBody => 'اس ہفتے کی معلومات تیار ہیں۔';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name $month ماہ کا ہو گیا! 🎉';
  }

  @override
  String get monthlyNotifBody => 'اس ماہ کی نشوونما دیکھیں۔';

  @override
  String babyAge(int months, int days) {
    return '$months ماہ $days دن';
  }

  @override
  String monthTitle(int month) {
    return 'ماہ $month کی نشوونما';
  }

  @override
  String get newbornTitle => 'نوزائیدہ دور';

  @override
  String get showMore => 'مزید پڑھیں';

  @override
  String get lastFeeding => 'آخری فیڈ';

  @override
  String get diapersToday => 'آج کے ڈائپر';

  @override
  String get sleepToday => 'آج کی نیند';

  @override
  String agoHM(int h, int m) {
    return '$h گھنٹے $m منٹ پہلے';
  }

  @override
  String agoM(int m) {
    return '$m منٹ پہلے';
  }

  @override
  String durationHM(int h, int m) {
    return '$h گھنٹے $m منٹ';
  }

  @override
  String get toolFeeding => 'خوراک';

  @override
  String get toolDiaper => 'ڈائپر';

  @override
  String get toolSleep => 'نیند';

  @override
  String get toolGrowth => 'نشوونما';

  @override
  String get breastLeft => 'بائیں';

  @override
  String get breastRight => 'دائیں';

  @override
  String get bottle => 'فیڈر';

  @override
  String get solid => 'ٹھوس غذا';

  @override
  String get tapToStop => 'ختم کرنے کے لیے اسی طرف دوبارہ ٹیپ کریں';

  @override
  String get bottleAmount => 'فیڈر کی مقدار';

  @override
  String get ml => 'ملی لیٹر';

  @override
  String get todaySummary => 'آج';

  @override
  String feedCount(int count) {
    return '$count فیڈ';
  }

  @override
  String breastMinutes(int minutes) {
    return 'دودھ پلانا $minutes منٹ';
  }

  @override
  String bottleTotal(int ml) {
    return 'فیڈر $ml ملی لیٹر';
  }

  @override
  String get diaperWet => 'گیلا';

  @override
  String get diaperDirty => 'گندا';

  @override
  String get diaperBoth => 'دونوں';

  @override
  String diaperCount(int count) {
    return '$count ڈائپر';
  }

  @override
  String get sleepStart => 'سو گیا';

  @override
  String get sleepStop => 'جاگ گیا';

  @override
  String get sleepRunning => 'سو رہا ہے';

  @override
  String sleepTotal(String duration) {
    return 'آج کل $duration';
  }

  @override
  String get growthAdd => 'پیمائش شامل کریں';

  @override
  String get growthWeight => 'وزن (کلو)';

  @override
  String get growthLength => 'قد (سینٹی میٹر)';

  @override
  String get growthHead => 'سر کا گھیر (سینٹی میٹر)';

  @override
  String get growthHeadShort => 'سر';

  @override
  String get growthEmpty => 'ابھی کوئی پیمائش نہیں۔ معائنے کی قدریں شامل کریں۔';

  @override
  String get whoMedian => 'ڈبلیو ایچ او اوسط';

  @override
  String get babyWeightLabel => 'بچے کا وزن';

  @override
  String monthAxis(int month) {
    return '$month ماہ';
  }

  @override
  String get otherTools => 'دیگر ٹولز';

  @override
  String get noRecords => 'ابھی کوئی ریکارڈ نہیں۔';

  @override
  String get dailyMsgSetting => 'صبح بخیر کے پیغامات';

  @override
  String get premiumTitle => 'اشتہارات ہٹائیں';

  @override
  String get premiumDesc =>
      'ایک بار ادائیگی کر کے ایپ کو بغیر اشتہارات کے استعمال کریں۔ یہ خریداری اسی اسٹور اکاؤنٹ والے آپ کے دوسرے آلات پر بھی لاگو ہوتی ہے۔';

  @override
  String premiumBuy(String price) {
    return 'اشتہارات سے پاک – $price';
  }

  @override
  String get premiumBuyNoPrice => 'اسٹور اس وقت دستیاب نہیں';

  @override
  String get premiumRestore => 'خریداری بحال کریں';

  @override
  String get premiumActive =>
      'اشتہارات سے پاک ورژن فعال ہے۔ آپ کے تعاون کا شکریہ 💕';

  @override
  String get premiumUnavailable =>
      'خریداری مکمل نہیں ہو سکی۔ براہ کرم بعد میں دوبارہ کوشش کریں۔';

  @override
  String get premiumThanks => 'شکریہ! اب آپ کو اشتہارات نظر نہیں آئیں گے 💕';
}
