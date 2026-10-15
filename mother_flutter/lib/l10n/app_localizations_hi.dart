// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class LHi extends L {
  LHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'मेरा बेबी';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सहेजें';

  @override
  String get delete => 'हटाएँ';

  @override
  String get add => 'जोड़ें';

  @override
  String get deleteAll => 'सब हटाएँ';

  @override
  String get saved => 'सहेजा गया';

  @override
  String get swipeToDelete => 'हटाने के लिए बाईं ओर स्वाइप करें।';

  @override
  String get history => 'इतिहास';

  @override
  String get start => 'शुरू करें';

  @override
  String weekAxis(int week) {
    return 'सप्ताह $week';
  }

  @override
  String get welcomeTitle => 'स्वागत है';

  @override
  String get welcomeSubtitle =>
      'आपकी गर्भावस्था को सप्ताह-दर-सप्ताह फ़ॉलो करने के लिए हमें कुछ जानकारी चाहिए।';

  @override
  String get babyName => 'बच्चे का नाम';

  @override
  String get sexLabel => 'लिंग';

  @override
  String get sexGirl => 'लड़की';

  @override
  String get sexBoy => 'लड़का';

  @override
  String get sexUnknown => 'अभी पता नहीं';

  @override
  String get kinLabel => 'बच्चे से आपका रिश्ता';

  @override
  String get kinMother => 'माँ';

  @override
  String get kinFather => 'पिता';

  @override
  String get kinAuntMaternal => 'मौसी';

  @override
  String get kinAuntPaternal => 'बुआ';

  @override
  String get kinUncleMaternal => 'मामा';

  @override
  String get kinUnclePaternal => 'चाचा';

  @override
  String get kinSibling => 'भाई या बहन';

  @override
  String get kinGrandmother => 'दादी / नानी';

  @override
  String get kinGrandfather => 'दादा / नाना';

  @override
  String get kinOther => 'रिश्तेदार';

  @override
  String get whichDate => 'आपको कौन-सी तारीख पता है?';

  @override
  String get lastPeriod => 'आख़िरी पीरियड';

  @override
  String get dueDateShort => 'ड्यू डेट';

  @override
  String get lastPeriodLong => 'आख़िरी पीरियड का पहला दिन';

  @override
  String get dueDateLong => 'डिलीवरी की अनुमानित तारीख';

  @override
  String get tapToSelect => 'चुनने के लिए टैप करें';

  @override
  String profilePreview(String date, int week, int day) {
    return 'ड्यू डेट: $date · सप्ताह $week, दिन $day';
  }

  @override
  String get begin => 'शुरू करें';

  @override
  String get nameRequired => 'कृपया बच्चे का नाम (या उपनाम) लिखें।';

  @override
  String get dateRequired => 'कृपया तारीख चुनें।';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get languageSystem => 'फ़ोन की भाषा';

  @override
  String get privacyOptions => 'विज्ञापन गोपनीयता विकल्प';

  @override
  String get factoryReset => 'सारा डेटा मिटाएँ';

  @override
  String get factoryResetTitle => 'सारा डेटा मिटाएँ';

  @override
  String get factoryResetMessage =>
      'वज़न, दवा, काउंटर, सूची और फ़ोटो का सारा डेटा मिट जाएगा। क्या आप सुनिश्चित हैं?';

  @override
  String weekDay(int week, int day) {
    return 'सप्ताह $week, दिन $day';
  }

  @override
  String trimester(int n) {
    return 'तिमाही $n';
  }

  @override
  String get daysPassed => 'दिन बीते';

  @override
  String get daysLeft => 'दिन बाकी';

  @override
  String get dueDate => 'ड्यू डेट';

  @override
  String get babyToday => 'मेरा बेबी आज';

  @override
  String get motherToday => 'माँ आज';

  @override
  String dailyBabyTitle(int week) {
    return 'मेरा बेबी · सप्ताह $week';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'माँ · सप्ताह $week';
  }

  @override
  String get noInfoToday => 'आज के लिए कोई जानकारी नहीं मिली।';

  @override
  String get ringBirth => 'जन्म तक';

  @override
  String get ringTests => 'जाँचें';

  @override
  String get ringNeeds => 'ज़रूरतें';

  @override
  String get ringBag => 'बैग';

  @override
  String get weightChange => 'वज़न में बदलाव';

  @override
  String get tools => 'टूल्स';

  @override
  String get toolWeight => 'वज़न ट्रैकर';

  @override
  String get toolMedicine => 'दवा ट्रैकर';

  @override
  String get toolKick => 'किक काउंटर';

  @override
  String get toolContraction => 'संकुचन टाइमर';

  @override
  String get toolNeeds => 'बेबी की ज़रूरतें';

  @override
  String get toolBag => 'अस्पताल बैग';

  @override
  String get toolTests => 'स्वास्थ्य जाँचें';

  @override
  String get toolNames => 'नाम खोजें';

  @override
  String get toolAlbum => 'फ़ोटो एल्बम';

  @override
  String get suggest => 'सुझाव भेजें';

  @override
  String get rate => 'रेटिंग दें';

  @override
  String get emailError => 'ईमेल ऐप नहीं खुल सका।';

  @override
  String get suggestSubject => 'मेरा बेबी ऐप के लिए सुझाव';

  @override
  String get suggestBody => 'आपका सुझाव:';

  @override
  String get weightStart => 'आपका शुरुआती वज़न';

  @override
  String get weightToday => 'आज आपका वज़न';

  @override
  String get weightHint => 'जैसे 62.5';

  @override
  String get kg => 'किग्रा';

  @override
  String get weightAdd => 'वज़न जोड़ें';

  @override
  String get weightClearTitle => 'वज़न डेटा';

  @override
  String get weightClearMessage => 'वज़न के सभी रिकॉर्ड मिट जाएँगे।';

  @override
  String get weightEmpty =>
      'अभी कोई रिकॉर्ड नहीं। शुरू करने के लिए अपना शुरुआती वज़न डालें।';

  @override
  String totalChange(String value) {
    return 'कुल बदलाव: $value किग्रा';
  }

  @override
  String weekAndDate(int week, String date) {
    return 'सप्ताह $week · $date';
  }

  @override
  String get medAdd => 'दवा जोड़ें';

  @override
  String get medEmpty =>
      'अपनी दवाएँ जोड़ें; हम हर दिन आपके चुने समय पर याद दिलाएँगे।';

  @override
  String get medNew => 'नई दवा';

  @override
  String get medEdit => 'दवा बदलें';

  @override
  String get medName => 'दवा का नाम';

  @override
  String get medTime => 'समय';

  @override
  String get medReminderOn => 'रिमाइंडर चालू';

  @override
  String medDaily(String time, String meal) {
    return 'हर दिन $time · $meal';
  }

  @override
  String get mealEmpty => 'खाली पेट';

  @override
  String get mealFull => 'खाने के बाद';

  @override
  String get mealAny => 'कोई फ़र्क नहीं';

  @override
  String notifTitle(String name) {
    return 'दवा: $name';
  }

  @override
  String get notifEmpty => 'खाली पेट लेना न भूलें';

  @override
  String get notifFull => 'खाने के बाद लेना न भूलें';

  @override
  String get notifAny => 'दवा लेने का समय';

  @override
  String get notifChannel => 'दवा रिमाइंडर';

  @override
  String get notifChannelDesc => 'दवा के समय पर रिमाइंडर';

  @override
  String get notifPermissionDenied =>
      'नोटिफ़िकेशन की अनुमति नहीं मिली; रिमाइंडर नहीं बजेगा।';

  @override
  String get kickIdle => 'किक';

  @override
  String get kickTap => 'किक!';

  @override
  String get stopAndSave => 'खत्म करें और सहेजें';

  @override
  String get kickHelp =>
      'जब भी बच्चा हिले, गोले पर टैप करें। सामान्य दिशानिर्देश: 2 घंटे में 10 हलचल। चिंता हो तो अपने डॉक्टर से बात करें।';

  @override
  String get kickEmpty => 'कोई सहेजा सत्र नहीं।';

  @override
  String kickRow(int count, String duration) {
    return '$count किक · $duration';
  }

  @override
  String get contractionRunning => 'संकुचन जारी है';

  @override
  String get contractionIdle => 'संकुचन शुरू होने पर टैप करें';

  @override
  String get contractionStartBtn => 'शुरू';

  @override
  String get contractionStopBtn => 'खत्म';

  @override
  String get contractionHelp =>
      'अगर संकुचन नियमित हों और पास-पास आने लगें (जैसे हर 5 मिनट, 1 मिनट तक), तो अपने डॉक्टर से संपर्क करें।';

  @override
  String get contractionEmpty => 'कोई सहेजा संकुचन नहीं।';

  @override
  String contractionDuration(String duration) {
    return 'अवधि $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'पिछले से अंतर $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'पिछला घंटा: $count संकुचन · औसत अवधि $length, हर $minutes मिनट';
  }

  @override
  String progressLabel(int done, int total) {
    return '$total में से $done पूरे';
  }

  @override
  String get addItem => 'आइटम जोड़ें';

  @override
  String get newItem => 'नया आइटम';

  @override
  String get customGroup => 'मेरे आइटम';

  @override
  String get testsDisclaimer =>
      'यह सूची केवल सामान्य जानकारी के लिए है; अपनी जाँचों का शेड्यूल अपने डॉक्टर से पूछें।';

  @override
  String get namesTitle => 'मेरे बेबी का नाम';

  @override
  String get spinning => 'पहिया घूम रहा है…';

  @override
  String get namesHint => 'पहिये पर टैप करें या फ़ोन हिलाएँ';

  @override
  String get nameError => 'नाम नहीं मिल सका।';

  @override
  String get shareAll => 'सब शेयर करें';

  @override
  String get ultrasoundPhoto => 'अल्ट्रासाउंड फ़ोटो';

  @override
  String get takePhoto => 'फ़ोटो लें';

  @override
  String get pickGallery => 'गैलरी से चुनें';

  @override
  String get share => 'शेयर करें';

  @override
  String get remove => 'हटाएँ';

  @override
  String get photoError => 'फ़ोटो नहीं मिल सकी। अनुमतियाँ जाँचें।';

  @override
  String get addPhotosFirst => 'पहले एल्बम में फ़ोटो जोड़ें।';

  @override
  String photoN(int n) {
    return 'फ़ोटो $n';
  }

  @override
  String get shareText => 'मेरे बेबी की अल्ट्रासाउंड फ़ोटो';

  @override
  String get shareAllText => 'मेरे बेबी का अल्ट्रासाउंड एल्बम';

  @override
  String get chartBaby => 'बेबी (अनुमानित)';

  @override
  String get chartMother => 'माँ';

  @override
  String get gram => 'ग्रा';

  @override
  String babyWeightNow(String value) {
    return 'बेबी का अनुमानित वज़न: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'बेबी का वज़न 8वें सप्ताह से दिखाया जाता है।';

  @override
  String get babyWeightNote =>
      'ये औसत मान हैं; हर बच्चा अलग तरह बढ़ता है। अपने डॉक्टर से पूछें।';

  @override
  String get babyBornQuestion => 'क्या आपका बेबी आ गया? 🎉';

  @override
  String get babyBornAction => 'मेरा बेबी आ गया';

  @override
  String get babyBornTitle => 'स्वागत है, नन्हे!';

  @override
  String get birthDateLabel => 'जन्म तिथि';

  @override
  String get birthWeight => 'जन्म का वज़न (किग्रा)';

  @override
  String get birthLength => 'जन्म की लंबाई (सेमी)';

  @override
  String get optional => 'वैकल्पिक';

  @override
  String get backToPregnancy => 'गर्भावस्था मोड पर लौटें';

  @override
  String get weeklyNotifSetting => 'साप्ताहिक सूचनाएँ';

  @override
  String get weeklyNotifChannel => 'साप्ताहिक जानकारी';

  @override
  String weeklyNotifTitle(int week) {
    return 'सप्ताह $week में स्वागत है 💕';
  }

  @override
  String get weeklyNotifBody => 'इस सप्ताह की जानकारी तैयार है।';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name $month महीने का हो गया! 🎉';
  }

  @override
  String get monthlyNotifBody => 'इस महीने का विकास देखें।';

  @override
  String babyAge(int months, int days) {
    return '$months माह $days दिन';
  }

  @override
  String monthTitle(int month) {
    return '$monthवें महीने का विकास';
  }

  @override
  String get newbornTitle => 'नवजात अवधि';

  @override
  String get showMore => 'और पढ़ें';

  @override
  String get lastFeeding => 'पिछली फ़ीड';

  @override
  String get diapersToday => 'आज के डायपर';

  @override
  String get sleepToday => 'आज की नींद';

  @override
  String agoHM(int h, int m) {
    return '$h घं $m मि पहले';
  }

  @override
  String agoM(int m) {
    return '$m मि पहले';
  }

  @override
  String durationHM(int h, int m) {
    return '$h घं $m मि';
  }

  @override
  String get toolFeeding => 'फ़ीडिंग';

  @override
  String get toolDiaper => 'डायपर';

  @override
  String get toolSleep => 'नींद';

  @override
  String get toolGrowth => 'विकास';

  @override
  String get breastLeft => 'बायाँ';

  @override
  String get breastRight => 'दायाँ';

  @override
  String get bottle => 'बोतल';

  @override
  String get solid => 'ठोस आहार';

  @override
  String get tapToStop => 'खत्म करने के लिए उसी तरफ़ फिर टैप करें';

  @override
  String get bottleAmount => 'बोतल की मात्रा';

  @override
  String get ml => 'मिली';

  @override
  String get todaySummary => 'आज';

  @override
  String feedCount(int count) {
    return '$count फ़ीड';
  }

  @override
  String breastMinutes(int minutes) {
    return 'स्तनपान $minutes मि';
  }

  @override
  String bottleTotal(int ml) {
    return 'बोतल $ml मिली';
  }

  @override
  String get diaperWet => 'गीला';

  @override
  String get diaperDirty => 'गंदा';

  @override
  String get diaperBoth => 'दोनों';

  @override
  String diaperCount(int count) {
    return '$count डायपर';
  }

  @override
  String get sleepStart => 'सो गया';

  @override
  String get sleepStop => 'जाग गया';

  @override
  String get sleepRunning => 'सो रहा है';

  @override
  String sleepTotal(String duration) {
    return 'आज कुल $duration';
  }

  @override
  String get growthAdd => 'माप जोड़ें';

  @override
  String get growthWeight => 'वज़न (किग्रा)';

  @override
  String get growthLength => 'लंबाई (सेमी)';

  @override
  String get growthHead => 'सिर की परिधि (सेमी)';

  @override
  String get growthHeadShort => 'सिर';

  @override
  String get growthEmpty => 'अभी कोई माप नहीं। जाँच में मापे गए मान जोड़ें।';

  @override
  String get whoMedian => 'WHO औसत';

  @override
  String get babyWeightLabel => 'बेबी का वज़न';

  @override
  String monthAxis(int month) {
    return '$month माह';
  }

  @override
  String get otherTools => 'अन्य टूल्स';

  @override
  String get noRecords => 'अभी कोई रिकॉर्ड नहीं।';

  @override
  String get dailyMsgSetting => 'सुप्रभात संदेश';

  @override
  String get premiumTitle => 'विज्ञापन हटाएँ';

  @override
  String get premiumDesc =>
      'एक बार भुगतान करके ऐप को बिना विज्ञापनों के इस्तेमाल करें। यह खरीद उसी स्टोर खाते वाले आपके दूसरे डिवाइस पर भी मान्य है।';

  @override
  String premiumBuy(String price) {
    return 'विज्ञापन-मुक्त – $price';
  }

  @override
  String get premiumBuyNoPrice => 'स्टोर अभी उपलब्ध नहीं है';

  @override
  String get premiumRestore => 'खरीद बहाल करें';

  @override
  String get premiumActive =>
      'विज्ञापन-मुक्त संस्करण चालू है। आपके सहयोग के लिए धन्यवाद 💕';

  @override
  String get premiumUnavailable =>
      'खरीद पूरी नहीं हो सकी। कृपया बाद में फिर से कोशिश करें।';

  @override
  String get premiumThanks => 'धन्यवाद! अब आपको विज्ञापन नहीं दिखेंगे 💕';
}
