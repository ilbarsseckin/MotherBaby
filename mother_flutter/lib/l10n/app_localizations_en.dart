// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String weekN(int week) {
    return 'Week $week';
  }

  @override
  String get appTitle => 'My Baby';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get add => 'Add';

  @override
  String get deleteAll => 'Delete all';

  @override
  String get saved => 'Saved';

  @override
  String get swipeToDelete => 'Swipe left to delete.';

  @override
  String get history => 'History';

  @override
  String get start => 'Start';

  @override
  String weekAxis(int week) {
    return 'wk $week';
  }

  @override
  String get welcomeTitle => 'Welcome';

  @override
  String get welcomeSubtitle =>
      'We need a few details to follow your pregnancy week by week.';

  @override
  String get babyName => 'Baby\'s name';

  @override
  String get sexLabel => 'Sex';

  @override
  String get sexGirl => 'Girl';

  @override
  String get sexBoy => 'Boy';

  @override
  String get sexUnknown => 'Not known yet';

  @override
  String get kinLabel => 'You are the baby\'s...';

  @override
  String get kinMother => 'Mother';

  @override
  String get kinFather => 'Father';

  @override
  String get kinAuntMaternal => 'Aunt (mother\'s side)';

  @override
  String get kinAuntPaternal => 'Aunt (father\'s side)';

  @override
  String get kinUncleMaternal => 'Uncle (mother\'s side)';

  @override
  String get kinUnclePaternal => 'Uncle (father\'s side)';

  @override
  String get kinSibling => 'Sibling';

  @override
  String get kinGrandmother => 'Grandmother';

  @override
  String get kinGrandfather => 'Grandfather';

  @override
  String get kinOther => 'Relative';

  @override
  String get whichDate => 'Which date do you know?';

  @override
  String get lastPeriod => 'Last period';

  @override
  String get dueDateShort => 'Due date';

  @override
  String get lastPeriodLong => 'First day of last period';

  @override
  String get dueDateLong => 'Estimated due date';

  @override
  String get tapToSelect => 'Tap to select';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Due date: $date · week $week, day $day';
  }

  @override
  String get begin => 'Get started';

  @override
  String get nameRequired => 'Please enter a name (or nickname) for your baby.';

  @override
  String get dateRequired => 'Please select the date.';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'Phone language';

  @override
  String get privacyOptions => 'Ad privacy options';

  @override
  String get factoryReset => 'Reset all data';

  @override
  String get factoryResetTitle => 'Reset all data';

  @override
  String get factoryResetMessage =>
      'All your weight, medicine, counter, list and photo data will be deleted. Are you sure?';

  @override
  String weekDay(int week, int day) {
    return 'Week $week, day $day';
  }

  @override
  String trimester(int n) {
    return 'Trimester $n';
  }

  @override
  String get daysPassed => 'days passed';

  @override
  String get daysLeft => 'days left';

  @override
  String get dueDate => 'due date';

  @override
  String get babyToday => 'My baby today';

  @override
  String get motherToday => 'Mom today';

  @override
  String dailyBabyTitle(int week) {
    return 'My baby · week $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Mom · week $week';
  }

  @override
  String get noInfoToday => 'No information found for today.';

  @override
  String get ringBirth => 'To birth';

  @override
  String get ringTests => 'Tests';

  @override
  String get ringNeeds => 'Needs';

  @override
  String get ringBag => 'Bag';

  @override
  String get weightChange => 'Weight change';

  @override
  String get tools => 'Tools';

  @override
  String get toolWeight => 'Weight Tracker';

  @override
  String get toolMedicine => 'Medicine Tracker';

  @override
  String get toolKick => 'Kick Counter';

  @override
  String get toolContraction => 'Contraction Timer';

  @override
  String get toolNeeds => 'Baby Checklist';

  @override
  String get toolBag => 'Hospital Bag';

  @override
  String get toolTests => 'Health Tests';

  @override
  String get toolNames => 'Name Finder';

  @override
  String get toolAlbum => 'Photo Album';

  @override
  String get suggest => 'Send feedback';

  @override
  String get rate => 'Rate us';

  @override
  String get emailError => 'Could not open an email app.';

  @override
  String get suggestSubject => 'My Baby app feedback';

  @override
  String get suggestBody => 'Your suggestion:';

  @override
  String get weightStart => 'Your starting weight';

  @override
  String get weightToday => 'Your weight today';

  @override
  String get weightHint => 'e.g. 62.5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Add weight';

  @override
  String get weightClearTitle => 'Weight data';

  @override
  String get weightClearMessage => 'All your weight records will be deleted.';

  @override
  String get weightEmpty =>
      'No records yet. Enter your starting weight to begin tracking.';

  @override
  String totalChange(String value) {
    return 'Total change: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'Week $week · $date';
  }

  @override
  String get medAdd => 'Add medicine';

  @override
  String get medEmpty =>
      'Add your medicines and we\'ll remind you every day at the time you choose.';

  @override
  String get medNew => 'New medicine';

  @override
  String get medEdit => 'Edit medicine';

  @override
  String get medName => 'Medicine name';

  @override
  String get medTime => 'Time';

  @override
  String get medReminderOn => 'Reminder on';

  @override
  String medDaily(String time, String meal) {
    return 'Every day $time · $meal';
  }

  @override
  String get mealEmpty => 'Empty stomach';

  @override
  String get mealFull => 'After a meal';

  @override
  String get mealAny => 'Anytime';

  @override
  String notifTitle(String name) {
    return 'Medicine: $name';
  }

  @override
  String get notifEmpty => 'Remember to take it on an empty stomach';

  @override
  String get notifFull => 'Remember to take it after a meal';

  @override
  String get notifAny => 'Time to take your medicine';

  @override
  String get notifChannel => 'Medicine reminder';

  @override
  String get notifChannelDesc => 'Reminders at medicine times';

  @override
  String get notifPermissionDenied =>
      'Notification permission denied; the reminder won\'t ring.';

  @override
  String get kickIdle => 'kicks';

  @override
  String get kickTap => 'KICK!';

  @override
  String get stopAndSave => 'Finish and save';

  @override
  String get kickHelp =>
      'Tap the circle every time your baby moves. General guideline: 10 movements within 2 hours. If you\'re worried, talk to your doctor.';

  @override
  String get kickEmpty => 'No saved sessions.';

  @override
  String kickRow(int count, String duration) {
    return '$count kicks · $duration';
  }

  @override
  String get contractionRunning => 'Contraction in progress';

  @override
  String get contractionIdle => 'Tap when a contraction starts';

  @override
  String get contractionStartBtn => 'STARTED';

  @override
  String get contractionStopBtn => 'ENDED';

  @override
  String get contractionHelp =>
      'If contractions are regular and getting closer (e.g. every 5 minutes, lasting 1 minute), contact your doctor.';

  @override
  String get contractionEmpty => 'No saved contractions.';

  @override
  String contractionDuration(String duration) {
    return 'Duration $duration';
  }

  @override
  String contractionGap(String duration) {
    return '$duration since previous';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Last hour: $count contractions · lasting $length on average, every $minutes minutes';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total completed';
  }

  @override
  String get addItem => 'Add item';

  @override
  String get newItem => 'New item';

  @override
  String get customGroup => 'My items';

  @override
  String get testsDisclaimer =>
      'This list is for general information only; ask your doctor for your personal test schedule.';

  @override
  String get namesTitle => 'My Baby\'s Name';

  @override
  String get spinning => 'Spinning…';

  @override
  String get namesHint => 'Tap the wheel or shake your phone';

  @override
  String get nameError => 'Couldn\'t get a name.';

  @override
  String get shareAll => 'Share all';

  @override
  String get ultrasoundPhoto => 'Ultrasound photo';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get pickGallery => 'Choose from gallery';

  @override
  String get share => 'Share';

  @override
  String get remove => 'Remove';

  @override
  String get photoError => 'Couldn\'t get the photo. Please check permissions.';

  @override
  String get addPhotosFirst => 'Add photos to the album first.';

  @override
  String photoN(int n) {
    return 'Photo $n';
  }

  @override
  String get shareText => 'My baby\'s ultrasound photo';

  @override
  String get shareAllText => 'My baby\'s ultrasound album';

  @override
  String get chartBaby => 'Baby (estimated)';

  @override
  String get chartMother => 'Mom';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Baby\'s estimated weight: $value';
  }

  @override
  String get babyWeightTooEarly => 'Baby\'s weight is shown from week 8.';

  @override
  String get babyWeightNote =>
      'These are averages; every baby grows differently. Ask your doctor for accurate information.';

  @override
  String get babyBornQuestion => 'Has your baby arrived? 🎉';

  @override
  String get babyBornAction => 'My baby is born';

  @override
  String get babyBornTitle => 'Welcome, little one!';

  @override
  String get birthDateLabel => 'Birth date';

  @override
  String get birthWeight => 'Birth weight (kg)';

  @override
  String get birthLength => 'Birth length (cm)';

  @override
  String get optional => 'optional';

  @override
  String get backToPregnancy => 'Back to pregnancy mode';

  @override
  String get weeklyNotifSetting => 'Weekly update notifications';

  @override
  String get weeklyNotifChannel => 'Weekly updates';

  @override
  String weeklyNotifTitle(int week) {
    return 'Welcome to week $week 💕';
  }

  @override
  String get weeklyNotifBody => 'This week\'s information is ready.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name is $month months old! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Check out this month\'s development.';

  @override
  String babyAge(int months, int days) {
    return '$months mo $days d';
  }

  @override
  String monthTitle(int month) {
    return 'Month $month development';
  }

  @override
  String get newbornTitle => 'Newborn period';

  @override
  String get showMore => 'Read more';

  @override
  String get lastFeeding => 'last feeding';

  @override
  String get diapersToday => 'diapers today';

  @override
  String get sleepToday => 'sleep today';

  @override
  String agoHM(int h, int m) {
    return '$h h $m min ago';
  }

  @override
  String agoM(int m) {
    return '$m min ago';
  }

  @override
  String durationHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get toolFeeding => 'Feeding';

  @override
  String get toolDiaper => 'Diapers';

  @override
  String get toolSleep => 'Sleep';

  @override
  String get toolGrowth => 'Growth';

  @override
  String get breastLeft => 'Left';

  @override
  String get breastRight => 'Right';

  @override
  String get bottle => 'Bottle';

  @override
  String get solid => 'Solids';

  @override
  String get tapToStop => 'Tap the same side again to finish';

  @override
  String get bottleAmount => 'Bottle amount';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Today';

  @override
  String feedCount(int count) {
    return '$count feedings';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Breastfeeding $minutes min';
  }

  @override
  String bottleTotal(int ml) {
    return 'Bottle $ml ml';
  }

  @override
  String get diaperWet => 'Wet';

  @override
  String get diaperDirty => 'Dirty';

  @override
  String get diaperBoth => 'Both';

  @override
  String diaperCount(int count) {
    return '$count diapers';
  }

  @override
  String get sleepStart => 'Fell asleep';

  @override
  String get sleepStop => 'Woke up';

  @override
  String get sleepRunning => 'Sleeping';

  @override
  String sleepTotal(String duration) {
    return 'Total today $duration';
  }

  @override
  String get growthAdd => 'Add measurement';

  @override
  String get growthWeight => 'Weight (kg)';

  @override
  String get growthLength => 'Length (cm)';

  @override
  String get growthHead => 'Head circumference (cm)';

  @override
  String get growthHeadShort => 'Head';

  @override
  String get growthEmpty =>
      'No measurements yet. Add the values measured at check-ups.';

  @override
  String get whoMedian => 'WHO average';

  @override
  String get babyWeightLabel => 'Baby\'s weight';

  @override
  String monthAxis(int month) {
    return '$month mo';
  }

  @override
  String get otherTools => 'Other tools';

  @override
  String get noRecords => 'No records yet.';

  @override
  String get dailyMsgSetting => 'Good-morning messages';

  @override
  String get premiumTitle => 'Remove ads';

  @override
  String get premiumDesc =>
      'Use the app ad-free with a one-time payment. The purchase also applies to your other devices with the same store account.';

  @override
  String premiumBuy(String price) {
    return 'Go ad-free – $price';
  }

  @override
  String get premiumBuyNoPrice => 'Store is not available right now';

  @override
  String get premiumRestore => 'Restore purchase';

  @override
  String get premiumActive =>
      'Ad-free version is active. Thank you for your support 💕';

  @override
  String get premiumUnavailable =>
      'The purchase could not be completed. Please try again later.';

  @override
  String get premiumThanks => 'Thank you! You won\'t see ads anymore 💕';
}
