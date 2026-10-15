// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class LAr extends L {
  LAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'طفلي';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get delete => 'حذف';

  @override
  String get add => 'إضافة';

  @override
  String get deleteAll => 'حذف الكل';

  @override
  String get saved => 'تم الحفظ';

  @override
  String get swipeToDelete => 'اسحبي إلى الجانب للحذف.';

  @override
  String get history => 'السجل';

  @override
  String get start => 'ابدئي';

  @override
  String weekAxis(int week) {
    return 'أ$week';
  }

  @override
  String get welcomeTitle => 'أهلاً بكِ';

  @override
  String get welcomeSubtitle =>
      'نحتاج إلى بعض المعلومات لمتابعة حملكِ أسبوعاً بأسبوع.';

  @override
  String get babyName => 'اسم الطفل';

  @override
  String get sexLabel => 'الجنس';

  @override
  String get sexGirl => 'بنت';

  @override
  String get sexBoy => 'ولد';

  @override
  String get sexUnknown => 'غير معروف بعد';

  @override
  String get kinLabel => 'صلتكِ بالطفل';

  @override
  String get kinMother => 'الأم';

  @override
  String get kinFather => 'الأب';

  @override
  String get kinAuntMaternal => 'الخالة';

  @override
  String get kinAuntPaternal => 'العمة';

  @override
  String get kinUncleMaternal => 'الخال';

  @override
  String get kinUnclePaternal => 'العم';

  @override
  String get kinSibling => 'الأخ أو الأخت';

  @override
  String get kinGrandmother => 'الجدة';

  @override
  String get kinGrandfather => 'الجد';

  @override
  String get kinOther => 'قريب';

  @override
  String get whichDate => 'أي تاريخ تعرفين؟';

  @override
  String get lastPeriod => 'آخر دورة';

  @override
  String get dueDateShort => 'موعد الولادة';

  @override
  String get lastPeriodLong => 'أول يوم من آخر دورة شهرية';

  @override
  String get dueDateLong => 'موعد الولادة المتوقع';

  @override
  String get tapToSelect => 'اضغطي للاختيار';

  @override
  String profilePreview(String date, int week, int day) {
    return 'موعد الولادة: $date · الأسبوع $week، اليوم $day';
  }

  @override
  String get begin => 'ابدئي';

  @override
  String get nameRequired => 'يرجى كتابة اسم (أو لقب) لطفلكِ.';

  @override
  String get dateRequired => 'يرجى اختيار التاريخ.';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get languageSystem => 'لغة الهاتف';

  @override
  String get privacyOptions => 'خيارات خصوصية الإعلانات';

  @override
  String get factoryReset => 'حذف جميع البيانات';

  @override
  String get factoryResetTitle => 'حذف جميع البيانات';

  @override
  String get factoryResetMessage =>
      'سيتم حذف جميع بيانات الوزن والأدوية والعدادات والقوائم والصور. هل أنتِ متأكدة؟';

  @override
  String weekDay(int week, int day) {
    return 'الأسبوع $week، اليوم $day';
  }

  @override
  String trimester(int n) {
    return 'الثلث $n';
  }

  @override
  String get daysPassed => 'يوماً مضت';

  @override
  String get daysLeft => 'يوماً متبقية';

  @override
  String get dueDate => 'موعد الولادة';

  @override
  String get babyToday => 'طفلي اليوم';

  @override
  String get motherToday => 'الأم اليوم';

  @override
  String dailyBabyTitle(int week) {
    return 'طفلي · الأسبوع $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'الأم · الأسبوع $week';
  }

  @override
  String get noInfoToday => 'لا توجد معلومات لهذا اليوم.';

  @override
  String get ringBirth => 'حتى الولادة';

  @override
  String get ringTests => 'الفحوصات';

  @override
  String get ringNeeds => 'المستلزمات';

  @override
  String get ringBag => 'الحقيبة';

  @override
  String get weightChange => 'تغيّر الوزن';

  @override
  String get tools => 'الأدوات';

  @override
  String get toolWeight => 'متابعة الوزن';

  @override
  String get toolMedicine => 'متابعة الأدوية';

  @override
  String get toolKick => 'عداد الركلات';

  @override
  String get toolContraction => 'عداد الانقباضات';

  @override
  String get toolNeeds => 'مستلزمات الطفل';

  @override
  String get toolBag => 'حقيبة الولادة';

  @override
  String get toolTests => 'الفحوصات الطبية';

  @override
  String get toolNames => 'اختيار اسم';

  @override
  String get toolAlbum => 'ألبوم الصور';

  @override
  String get suggest => 'إرسال اقتراح';

  @override
  String get rate => 'قيّمي التطبيق';

  @override
  String get emailError => 'تعذّر فتح تطبيق البريد.';

  @override
  String get suggestSubject => 'اقتراح لتطبيق طفلي';

  @override
  String get suggestBody => 'اقتراحكِ:';

  @override
  String get weightStart => 'وزنكِ عند البداية';

  @override
  String get weightToday => 'وزنكِ اليوم';

  @override
  String get weightHint => 'مثلاً 62.5';

  @override
  String get kg => 'كغ';

  @override
  String get weightAdd => 'إضافة وزن';

  @override
  String get weightClearTitle => 'بيانات الوزن';

  @override
  String get weightClearMessage => 'سيتم حذف جميع سجلات الوزن.';

  @override
  String get weightEmpty =>
      'لا توجد سجلات بعد. أدخلي وزنكِ عند البداية لتبدئي المتابعة.';

  @override
  String totalChange(String value) {
    return 'التغيّر الإجمالي: $value كغ';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'الأسبوع $week · $date';
  }

  @override
  String get medAdd => 'إضافة دواء';

  @override
  String get medEmpty =>
      'أضيفي أدويتكِ وسنذكّركِ بها يومياً في الوقت الذي تختارينه.';

  @override
  String get medNew => 'دواء جديد';

  @override
  String get medEdit => 'تعديل الدواء';

  @override
  String get medName => 'اسم الدواء';

  @override
  String get medTime => 'الوقت';

  @override
  String get medReminderOn => 'التذكير مفعّل';

  @override
  String medDaily(String time, String meal) {
    return 'يومياً $time · $meal';
  }

  @override
  String get mealEmpty => 'على معدة فارغة';

  @override
  String get mealFull => 'بعد الأكل';

  @override
  String get mealAny => 'لا فرق';

  @override
  String notifTitle(String name) {
    return 'الدواء: $name';
  }

  @override
  String get notifEmpty => 'لا تنسي تناوله على معدة فارغة';

  @override
  String get notifFull => 'لا تنسي تناوله بعد الأكل';

  @override
  String get notifAny => 'حان وقت الدواء';

  @override
  String get notifChannel => 'تذكير الأدوية';

  @override
  String get notifChannelDesc => 'تذكيرات في مواعيد الأدوية';

  @override
  String get notifPermissionDenied =>
      'لم يُمنح إذن الإشعارات؛ لن يعمل التذكير.';

  @override
  String get kickIdle => 'ركلات';

  @override
  String get kickTap => 'ركلة!';

  @override
  String get stopAndSave => 'إنهاء وحفظ';

  @override
  String get kickHelp =>
      'اضغطي على الدائرة كلما تحرك طفلكِ. قاعدة عامة: 10 حركات خلال ساعتين. إذا شعرتِ بالقلق فاستشيري طبيبكِ.';

  @override
  String get kickEmpty => 'لا توجد جلسات محفوظة.';

  @override
  String kickRow(int count, String duration) {
    return '$count ركلة · $duration';
  }

  @override
  String get contractionRunning => 'انقباض جارٍ';

  @override
  String get contractionIdle => 'اضغطي عند بدء الانقباض';

  @override
  String get contractionStartBtn => 'بدأ';

  @override
  String get contractionStopBtn => 'انتهى';

  @override
  String get contractionHelp =>
      'إذا أصبحت الانقباضات منتظمة ومتقاربة (مثلاً كل 5 دقائق ولمدة دقيقة)، فتواصلي مع طبيبكِ.';

  @override
  String get contractionEmpty => 'لا توجد انقباضات محفوظة.';

  @override
  String contractionDuration(String duration) {
    return 'المدة $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'الفاصل عن السابق $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'آخر ساعة: $count انقباضات · متوسط المدة $length، كل $minutes دقيقة';
  }

  @override
  String progressLabel(int done, int total) {
    return 'اكتمل $done من $total';
  }

  @override
  String get addItem => 'إضافة عنصر';

  @override
  String get newItem => 'عنصر جديد';

  @override
  String get customGroup => 'عناصري';

  @override
  String get testsDisclaimer =>
      'هذه القائمة للمعلومات العامة فقط؛ اسألي طبيبكِ عن جدول الفحوصات المناسب لكِ.';

  @override
  String get namesTitle => 'اسم طفلي';

  @override
  String get spinning => 'العجلة تدور…';

  @override
  String get namesHint => 'اضغطي على العجلة أو هزّي الهاتف';

  @override
  String get nameError => 'تعذّر الحصول على اسم.';

  @override
  String get shareAll => 'مشاركة الكل';

  @override
  String get ultrasoundPhoto => 'صورة السونار';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get pickGallery => 'اختيار من المعرض';

  @override
  String get share => 'مشاركة';

  @override
  String get remove => 'إزالة';

  @override
  String get photoError => 'تعذّر الحصول على الصورة. تحققي من الأذونات.';

  @override
  String get addPhotosFirst => 'أضيفي صوراً إلى الألبوم أولاً.';

  @override
  String photoN(int n) {
    return 'الصورة $n';
  }

  @override
  String get shareText => 'صورة السونار لطفلي';

  @override
  String get shareAllText => 'ألبوم السونار لطفلي';

  @override
  String get chartBaby => 'الطفل (تقديري)';

  @override
  String get chartMother => 'الأم';

  @override
  String get gram => 'غ';

  @override
  String babyWeightNow(String value) {
    return 'الوزن التقديري للطفل: $value';
  }

  @override
  String get babyWeightTooEarly => 'يظهر وزن الطفل ابتداءً من الأسبوع 8.';

  @override
  String get babyWeightNote =>
      'هذه قيم متوسطة؛ كل طفل ينمو بشكل مختلف. استشيري طبيبكِ.';

  @override
  String get babyBornQuestion => 'هل وُلد طفلكِ؟ 🎉';

  @override
  String get babyBornAction => 'وُلد طفلي';

  @override
  String get babyBornTitle => 'أهلاً بك يا صغيري!';

  @override
  String get birthDateLabel => 'تاريخ الولادة';

  @override
  String get birthWeight => 'الوزن عند الولادة (كغ)';

  @override
  String get birthLength => 'الطول عند الولادة (سم)';

  @override
  String get optional => 'اختياري';

  @override
  String get backToPregnancy => 'العودة إلى وضع الحمل';

  @override
  String get weeklyNotifSetting => 'إشعارات أسبوعية';

  @override
  String get weeklyNotifChannel => 'معلومات أسبوعية';

  @override
  String weeklyNotifTitle(int week) {
    return 'أهلاً بكِ في الأسبوع $week 💕';
  }

  @override
  String get weeklyNotifBody => 'معلومات هذا الأسبوع جاهزة.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return 'أتمّ $name $month أشهر! 🎉';
  }

  @override
  String get monthlyNotifBody => 'اطّلعي على نمو هذا الشهر.';

  @override
  String babyAge(int months, int days) {
    return '$months شهر $days يوم';
  }

  @override
  String monthTitle(int month) {
    return 'نمو الشهر $month';
  }

  @override
  String get newbornTitle => 'فترة حديث الولادة';

  @override
  String get showMore => 'اقرئي المزيد';

  @override
  String get lastFeeding => 'آخر رضعة';

  @override
  String get diapersToday => 'حفاضات اليوم';

  @override
  String get sleepToday => 'نوم اليوم';

  @override
  String agoHM(int h, int m) {
    return 'قبل $h س $m د';
  }

  @override
  String agoM(int m) {
    return 'قبل $m د';
  }

  @override
  String durationHM(int h, int m) {
    return '$h س $m د';
  }

  @override
  String get toolFeeding => 'الرضاعة';

  @override
  String get toolDiaper => 'الحفاضات';

  @override
  String get toolSleep => 'النوم';

  @override
  String get toolGrowth => 'النمو';

  @override
  String get breastLeft => 'يسار';

  @override
  String get breastRight => 'يمين';

  @override
  String get bottle => 'رضّاعة';

  @override
  String get solid => 'طعام صلب';

  @override
  String get tapToStop => 'اضغطي الجهة نفسها مرة أخرى للإنهاء';

  @override
  String get bottleAmount => 'كمية الرضّاعة';

  @override
  String get ml => 'مل';

  @override
  String get todaySummary => 'اليوم';

  @override
  String feedCount(int count) {
    return '$count رضعات';
  }

  @override
  String breastMinutes(int minutes) {
    return 'رضاعة طبيعية $minutes د';
  }

  @override
  String bottleTotal(int ml) {
    return 'رضّاعة $ml مل';
  }

  @override
  String get diaperWet => 'مبلل';

  @override
  String get diaperDirty => 'متسخ';

  @override
  String get diaperBoth => 'كلاهما';

  @override
  String diaperCount(int count) {
    return '$count حفاضات';
  }

  @override
  String get sleepStart => 'نام';

  @override
  String get sleepStop => 'استيقظ';

  @override
  String get sleepRunning => 'نائم';

  @override
  String sleepTotal(String duration) {
    return 'المجموع اليوم $duration';
  }

  @override
  String get growthAdd => 'إضافة قياس';

  @override
  String get growthWeight => 'الوزن (كغ)';

  @override
  String get growthLength => 'الطول (سم)';

  @override
  String get growthHead => 'محيط الرأس (سم)';

  @override
  String get growthHeadShort => 'الرأس';

  @override
  String get growthEmpty => 'لا توجد قياسات بعد. أضيفي قيم الفحوصات.';

  @override
  String get whoMedian => 'متوسط منظمة الصحة العالمية';

  @override
  String get babyWeightLabel => 'وزن الطفل';

  @override
  String monthAxis(int month) {
    return '$month ش';
  }

  @override
  String get otherTools => 'أدوات أخرى';

  @override
  String get noRecords => 'لا توجد سجلات بعد.';

  @override
  String get dailyMsgSetting => 'رسائل صباح الخير';

  @override
  String get premiumTitle => 'إزالة الإعلانات';

  @override
  String get premiumDesc =>
      'استخدمي التطبيق بدون إعلانات بدفعة واحدة. يسري الشراء أيضًا على أجهزتك الأخرى بنفس حساب المتجر.';

  @override
  String premiumBuy(String price) {
    return 'بدون إعلانات – $price';
  }

  @override
  String get premiumBuyNoPrice => 'المتجر غير متاح حاليًا';

  @override
  String get premiumRestore => 'استعادة الشراء';

  @override
  String get premiumActive =>
      'النسخة الخالية من الإعلانات مفعّلة. شكرًا لدعمك 💕';

  @override
  String get premiumUnavailable => 'تعذّر إتمام الشراء. يرجى المحاولة لاحقًا.';

  @override
  String get premiumThanks => 'شكرًا! لن تري إعلانات بعد الآن 💕';
}
