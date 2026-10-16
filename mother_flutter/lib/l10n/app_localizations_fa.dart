// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class LFa extends L {
  LFa([String locale = 'fa']) : super(locale);

  @override
  String weekN(int week) {
    return 'هفتهٔ $week';
  }

  @override
  String get appTitle => 'کودک من';

  @override
  String get cancel => 'لغو';

  @override
  String get save => 'ذخیره';

  @override
  String get delete => 'حذف';

  @override
  String get add => 'افزودن';

  @override
  String get deleteAll => 'حذف همه';

  @override
  String get saved => 'ذخیره شد';

  @override
  String get swipeToDelete => 'برای حذف به کنار بکشید.';

  @override
  String get history => 'سابقه';

  @override
  String get start => 'شروع';

  @override
  String weekAxis(int week) {
    return 'هفته $week';
  }

  @override
  String get welcomeTitle => 'خوش آمدید';

  @override
  String get welcomeSubtitle =>
      'برای پیگیری هفته به هفتهٔ بارداری شما به چند اطلاعات نیاز داریم.';

  @override
  String get babyName => 'نام کودک';

  @override
  String get sexLabel => 'جنسیت';

  @override
  String get sexGirl => 'دختر';

  @override
  String get sexBoy => 'پسر';

  @override
  String get sexUnknown => 'هنوز مشخص نیست';

  @override
  String get kinLabel => 'نسبت شما با کودک';

  @override
  String get kinMother => 'مادر';

  @override
  String get kinFather => 'پدر';

  @override
  String get kinAuntMaternal => 'خاله';

  @override
  String get kinAuntPaternal => 'عمه';

  @override
  String get kinUncleMaternal => 'دایی';

  @override
  String get kinUnclePaternal => 'عمو';

  @override
  String get kinSibling => 'خواهر یا برادر';

  @override
  String get kinGrandmother => 'مادربزرگ';

  @override
  String get kinGrandfather => 'پدربزرگ';

  @override
  String get kinOther => 'خویشاوند';

  @override
  String get whichDate => 'کدام تاریخ را می‌دانید؟';

  @override
  String get lastPeriod => 'آخرین قاعدگی';

  @override
  String get dueDateShort => 'تاریخ زایمان';

  @override
  String get lastPeriodLong => 'اولین روز آخرین قاعدگی';

  @override
  String get dueDateLong => 'تاریخ تخمینی زایمان';

  @override
  String get tapToSelect => 'برای انتخاب لمس کنید';

  @override
  String profilePreview(String date, int week, int day) {
    return 'تاریخ زایمان: $date · هفته $week، روز $day';
  }

  @override
  String get begin => 'شروع کنیم';

  @override
  String get nameRequired => 'لطفاً یک نام (یا لقب) برای کودک بنویسید.';

  @override
  String get dateRequired => 'لطفاً تاریخ را انتخاب کنید.';

  @override
  String get settings => 'تنظیمات';

  @override
  String get language => 'زبان';

  @override
  String get languageSystem => 'زبان گوشی';

  @override
  String get privacyOptions => 'گزینه‌های حریم خصوصی تبلیغات';

  @override
  String get factoryReset => 'حذف همهٔ داده‌ها';

  @override
  String get factoryResetTitle => 'حذف همهٔ داده‌ها';

  @override
  String get factoryResetMessage =>
      'همهٔ داده‌های وزن، دارو، شمارنده، فهرست و عکس حذف می‌شوند. مطمئن هستید؟';

  @override
  String weekDay(int week, int day) {
    return 'هفته $week، روز $day';
  }

  @override
  String trimester(int n) {
    return 'سه‌ماههٔ $n';
  }

  @override
  String get daysPassed => 'روز گذشته';

  @override
  String get daysLeft => 'روز مانده';

  @override
  String get dueDate => 'تاریخ زایمان';

  @override
  String get babyToday => 'کودکم امروز';

  @override
  String get motherToday => 'مادر امروز';

  @override
  String dailyBabyTitle(int week) {
    return 'کودکم · هفته $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'مادر · هفته $week';
  }

  @override
  String get noInfoToday => 'برای امروز اطلاعاتی پیدا نشد.';

  @override
  String get ringBirth => 'تا زایمان';

  @override
  String get ringTests => 'آزمایش‌ها';

  @override
  String get ringNeeds => 'سیسمونی';

  @override
  String get ringBag => 'ساک';

  @override
  String get weightChange => 'تغییر وزن';

  @override
  String get tools => 'ابزارها';

  @override
  String get toolWeight => 'پیگیری وزن';

  @override
  String get toolMedicine => 'پیگیری دارو';

  @override
  String get toolKick => 'شمارش لگد';

  @override
  String get toolContraction => 'شمارش انقباض';

  @override
  String get toolNeeds => 'فهرست سیسمونی';

  @override
  String get toolBag => 'ساک زایمان';

  @override
  String get toolTests => 'آزمایش‌های پزشکی';

  @override
  String get toolNames => 'انتخاب نام';

  @override
  String get toolAlbum => 'آلبوم عکس';

  @override
  String get suggest => 'ارسال پیشنهاد';

  @override
  String get rate => 'امتیاز دهید';

  @override
  String get emailError => 'برنامهٔ ایمیل باز نشد.';

  @override
  String get suggestSubject => 'پیشنهاد برای برنامهٔ کودک من';

  @override
  String get suggestBody => 'پیشنهاد شما:';

  @override
  String get weightStart => 'وزن شروع شما';

  @override
  String get weightToday => 'وزن امروز شما';

  @override
  String get weightHint => 'مثلاً ۶۲٫۵';

  @override
  String get kg => 'کیلوگرم';

  @override
  String get weightAdd => 'افزودن وزن';

  @override
  String get weightClearTitle => 'داده‌های وزن';

  @override
  String get weightClearMessage => 'همهٔ ثبت‌های وزن حذف می‌شوند.';

  @override
  String get weightEmpty =>
      'هنوز ثبتی نیست. برای شروع، وزن اولیهٔ خود را وارد کنید.';

  @override
  String totalChange(String value) {
    return 'تغییر کل: $value کیلوگرم';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'هفته $week · $date';
  }

  @override
  String get medAdd => 'افزودن دارو';

  @override
  String get medEmpty =>
      'داروهای خود را اضافه کنید؛ هر روز در ساعت انتخابی یادآوری می‌کنیم.';

  @override
  String get medNew => 'داروی جدید';

  @override
  String get medEdit => 'ویرایش دارو';

  @override
  String get medName => 'نام دارو';

  @override
  String get medTime => 'ساعت';

  @override
  String get medReminderOn => 'یادآور روشن';

  @override
  String medDaily(String time, String meal) {
    return 'هر روز $time · $meal';
  }

  @override
  String get mealEmpty => 'ناشتا';

  @override
  String get mealFull => 'بعد از غذا';

  @override
  String get mealAny => 'فرقی ندارد';

  @override
  String notifTitle(String name) {
    return 'دارو: $name';
  }

  @override
  String get notifEmpty => 'فراموش نکنید آن را ناشتا بخورید';

  @override
  String get notifFull => 'فراموش نکنید آن را بعد از غذا بخورید';

  @override
  String get notifAny => 'وقت خوردن دارو است';

  @override
  String get notifChannel => 'یادآور دارو';

  @override
  String get notifChannelDesc => 'یادآوری در زمان مصرف دارو';

  @override
  String get notifPermissionDenied =>
      'اجازهٔ اعلان داده نشد؛ یادآور به صدا درنمی‌آید.';

  @override
  String get kickIdle => 'لگد';

  @override
  String get kickTap => 'لگد!';

  @override
  String get stopAndSave => 'پایان و ذخیره';

  @override
  String get kickHelp =>
      'هر بار که کودک حرکت کرد، دایره را لمس کنید. قاعدهٔ کلی: ۱۰ حرکت در ۲ ساعت. اگر نگران هستید با پزشک خود مشورت کنید.';

  @override
  String get kickEmpty => 'جلسهٔ ذخیره‌شده‌ای نیست.';

  @override
  String kickRow(int count, String duration) {
    return '$count لگد · $duration';
  }

  @override
  String get contractionRunning => 'انقباض در جریان است';

  @override
  String get contractionIdle => 'هنگام شروع انقباض لمس کنید';

  @override
  String get contractionStartBtn => 'شروع شد';

  @override
  String get contractionStopBtn => 'تمام شد';

  @override
  String get contractionHelp =>
      'اگر انقباض‌ها منظم و نزدیک‌تر شدند (مثلاً هر ۵ دقیقه و هر کدام ۱ دقیقه)، با پزشک خود تماس بگیرید.';

  @override
  String get contractionEmpty => 'انقباض ذخیره‌شده‌ای نیست.';

  @override
  String contractionDuration(String duration) {
    return 'مدت $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'فاصله از قبلی $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'یک ساعت اخیر: $count انقباض · میانگین مدت $length، هر $minutes دقیقه';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done از $total انجام شد';
  }

  @override
  String get addItem => 'افزودن مورد';

  @override
  String get newItem => 'مورد جدید';

  @override
  String get customGroup => 'موارد من';

  @override
  String get testsDisclaimer =>
      'این فهرست فقط برای اطلاع عمومی است؛ برنامهٔ آزمایش‌های خود را از پزشکتان بپرسید.';

  @override
  String get namesTitle => 'نام کودکم';

  @override
  String get spinning => 'چرخ در حال چرخیدن…';

  @override
  String get namesHint => 'چرخ را لمس کنید یا گوشی را تکان دهید';

  @override
  String get nameError => 'نامی پیدا نشد.';

  @override
  String get shareAll => 'اشتراک همه';

  @override
  String get ultrasoundPhoto => 'عکس سونوگرافی';

  @override
  String get takePhoto => 'گرفتن عکس';

  @override
  String get pickGallery => 'انتخاب از گالری';

  @override
  String get share => 'اشتراک‌گذاری';

  @override
  String get remove => 'برداشتن';

  @override
  String get photoError => 'عکس دریافت نشد. مجوزها را بررسی کنید.';

  @override
  String get addPhotosFirst => 'ابتدا عکس‌هایی به آلبوم اضافه کنید.';

  @override
  String photoN(int n) {
    return 'عکس $n';
  }

  @override
  String get shareText => 'عکس سونوگرافی کودکم';

  @override
  String get shareAllText => 'آلبوم سونوگرافی کودکم';

  @override
  String get chartBaby => 'کودک (تخمینی)';

  @override
  String get chartMother => 'مادر';

  @override
  String get gram => 'گرم';

  @override
  String babyWeightNow(String value) {
    return 'وزن تخمینی کودک: $value';
  }

  @override
  String get babyWeightTooEarly => 'وزن کودک از هفتهٔ ۸ نمایش داده می‌شود.';

  @override
  String get babyWeightNote =>
      'این‌ها میانگین هستند؛ هر کودک متفاوت رشد می‌کند. از پزشک خود بپرسید.';

  @override
  String get babyBornQuestion => 'کودک شما به دنیا آمده؟ 🎉';

  @override
  String get babyBornAction => 'کودکم به دنیا آمد';

  @override
  String get babyBornTitle => 'خوش آمدی کوچولو!';

  @override
  String get birthDateLabel => 'تاریخ تولد';

  @override
  String get birthWeight => 'وزن هنگام تولد (کیلوگرم)';

  @override
  String get birthLength => 'قد هنگام تولد (سانتی‌متر)';

  @override
  String get optional => 'اختیاری';

  @override
  String get backToPregnancy => 'بازگشت به حالت بارداری';

  @override
  String get weeklyNotifSetting => 'اعلان‌های هفتگی';

  @override
  String get weeklyNotifChannel => 'اطلاعات هفتگی';

  @override
  String weeklyNotifTitle(int week) {
    return 'به هفتهٔ $week خوش آمدید 💕';
  }

  @override
  String get weeklyNotifBody => 'اطلاعات این هفته آماده است.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name $month ماهه شد! 🎉';
  }

  @override
  String get monthlyNotifBody => 'رشد این ماه را ببینید.';

  @override
  String babyAge(int months, int days) {
    return '$months ماه $days روز';
  }

  @override
  String monthTitle(int month) {
    return 'رشد ماه $month';
  }

  @override
  String get newbornTitle => 'دوران نوزادی';

  @override
  String get showMore => 'بیشتر بخوانید';

  @override
  String get lastFeeding => 'آخرین شیر';

  @override
  String get diapersToday => 'پوشک امروز';

  @override
  String get sleepToday => 'خواب امروز';

  @override
  String agoHM(int h, int m) {
    return '$h ساعت $m دقیقه پیش';
  }

  @override
  String agoM(int m) {
    return '$m دقیقه پیش';
  }

  @override
  String durationHM(int h, int m) {
    return '$h ساعت $m دقیقه';
  }

  @override
  String get toolFeeding => 'تغذیه';

  @override
  String get toolDiaper => 'پوشک';

  @override
  String get toolSleep => 'خواب';

  @override
  String get toolGrowth => 'رشد';

  @override
  String get breastLeft => 'چپ';

  @override
  String get breastRight => 'راست';

  @override
  String get bottle => 'شیشه شیر';

  @override
  String get solid => 'غذای کمکی';

  @override
  String get tapToStop => 'برای پایان دوباره همان سمت را لمس کنید';

  @override
  String get bottleAmount => 'مقدار شیشه شیر';

  @override
  String get ml => 'میلی‌لیتر';

  @override
  String get todaySummary => 'امروز';

  @override
  String feedCount(int count) {
    return '$count بار تغذیه';
  }

  @override
  String breastMinutes(int minutes) {
    return 'شیردهی $minutes دقیقه';
  }

  @override
  String bottleTotal(int ml) {
    return 'شیشه $ml میلی‌لیتر';
  }

  @override
  String get diaperWet => 'خیس';

  @override
  String get diaperDirty => 'کثیف';

  @override
  String get diaperBoth => 'هر دو';

  @override
  String diaperCount(int count) {
    return '$count پوشک';
  }

  @override
  String get sleepStart => 'خوابید';

  @override
  String get sleepStop => 'بیدار شد';

  @override
  String get sleepRunning => 'خواب است';

  @override
  String sleepTotal(String duration) {
    return 'مجموع امروز $duration';
  }

  @override
  String get growthAdd => 'افزودن اندازه‌گیری';

  @override
  String get growthWeight => 'وزن (کیلوگرم)';

  @override
  String get growthLength => 'قد (سانتی‌متر)';

  @override
  String get growthHead => 'دور سر (سانتی‌متر)';

  @override
  String get growthHeadShort => 'سر';

  @override
  String get growthEmpty =>
      'هنوز اندازه‌ای ثبت نشده. مقادیر معاینه‌ها را اضافه کنید.';

  @override
  String get whoMedian => 'میانگین سازمان جهانی بهداشت';

  @override
  String get babyWeightLabel => 'وزن کودک';

  @override
  String monthAxis(int month) {
    return '$month ماه';
  }

  @override
  String get otherTools => 'ابزارهای دیگر';

  @override
  String get noRecords => 'هنوز موردی ثبت نشده.';

  @override
  String get dailyMsgSetting => 'پیام‌های صبح بخیر';

  @override
  String get premiumTitle => 'حذف تبلیغات';

  @override
  String get premiumDesc =>
      'با یک پرداخت یک‌باره، برنامه را بدون تبلیغات استفاده کنید. این خرید در دستگاه‌های دیگر شما با همان حساب فروشگاه هم معتبر است.';

  @override
  String premiumBuy(String price) {
    return 'بدون تبلیغات – $price';
  }

  @override
  String get premiumBuyNoPrice => 'فروشگاه در حال حاضر در دسترس نیست';

  @override
  String get premiumRestore => 'بازیابی خرید';

  @override
  String get premiumActive =>
      'نسخه بدون تبلیغات فعال است. از حمایت شما سپاسگزاریم 💕';

  @override
  String get premiumUnavailable =>
      'خرید انجام نشد. لطفاً بعداً دوباره تلاش کنید.';

  @override
  String get premiumThanks => 'سپاسگزاریم! دیگر تبلیغی نخواهید دید 💕';
}
