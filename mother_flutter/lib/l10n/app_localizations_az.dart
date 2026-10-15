// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class LAz extends L {
  LAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'Körpəm';

  @override
  String get cancel => 'Ləğv et';

  @override
  String get save => 'Yadda saxla';

  @override
  String get delete => 'Sil';

  @override
  String get add => 'Əlavə et';

  @override
  String get deleteAll => 'Hamısını sil';

  @override
  String get saved => 'Yadda saxlanıldı';

  @override
  String get swipeToDelete => 'Silmək üçün sola sürüşdürün.';

  @override
  String get history => 'Tarixçə';

  @override
  String get start => 'Başla';

  @override
  String weekAxis(int week) {
    return '$week. hft';
  }

  @override
  String get welcomeTitle => 'Xoş gəlmisiniz';

  @override
  String get welcomeSubtitle =>
      'Hamiləliyinizi həftə-həftə izləmək üçün bir neçə məlumata ehtiyacımız var.';

  @override
  String get babyName => 'Körpənin adı';

  @override
  String get sexLabel => 'Cinsi';

  @override
  String get sexGirl => 'Qız';

  @override
  String get sexBoy => 'Oğlan';

  @override
  String get sexUnknown => 'Hələ bəlli deyil';

  @override
  String get kinLabel => 'Siz körpənin...';

  @override
  String get kinMother => 'Anası';

  @override
  String get kinFather => 'Atası';

  @override
  String get kinAuntMaternal => 'Xalası';

  @override
  String get kinAuntPaternal => 'Bibisi';

  @override
  String get kinUncleMaternal => 'Dayısı';

  @override
  String get kinUnclePaternal => 'Əmisi';

  @override
  String get kinSibling => 'Bacısı / qardaşı';

  @override
  String get kinGrandmother => 'Nənəsi';

  @override
  String get kinGrandfather => 'Babası';

  @override
  String get kinOther => 'Yaxını';

  @override
  String get whichDate => 'Hansı tarixi bilirsiniz?';

  @override
  String get lastPeriod => 'Son aybaşı';

  @override
  String get dueDateShort => 'Təxmini doğuş';

  @override
  String get lastPeriodLong => 'Son aybaşının ilk günü';

  @override
  String get dueDateLong => 'Təxmini doğuş tarixi';

  @override
  String get tapToSelect => 'Seçmək üçün toxunun';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Təxmini doğuş: $date · $week. həftə $day. gün';
  }

  @override
  String get begin => 'Başla';

  @override
  String get nameRequired => 'Zəhmət olmasa körpəyə ad (və ya ləqəb) yazın.';

  @override
  String get dateRequired => 'Zəhmət olmasa tarixi seçin.';

  @override
  String get settings => 'Ayarlar';

  @override
  String get language => 'Dil';

  @override
  String get languageSystem => 'Telefonun dili';

  @override
  String get privacyOptions => 'Reklam məxfilik seçimləri';

  @override
  String get factoryReset => 'Bütün məlumatları sil';

  @override
  String get factoryResetTitle => 'Bütün məlumatları sil';

  @override
  String get factoryResetMessage =>
      'Çəki, dərman, sayğac, siyahı və foto məlumatlarının hamısı silinəcək. Əminsiniz?';

  @override
  String weekDay(int week, int day) {
    return '$week. həftə $day. gün';
  }

  @override
  String trimester(int n) {
    return '$n. trimestr';
  }

  @override
  String get daysPassed => 'keçən gün';

  @override
  String get daysLeft => 'qalan gün';

  @override
  String get dueDate => 'təxmini doğuş';

  @override
  String get babyToday => 'Körpəm bu gün';

  @override
  String get motherToday => 'Ana bu gün';

  @override
  String dailyBabyTitle(int week) {
    return '$week. həftə körpəm';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Ana · $week. həftə';
  }

  @override
  String get noInfoToday => 'Bu gün üçün məlumat tapılmadı.';

  @override
  String get ringBirth => 'Doğuşa';

  @override
  String get ringTests => 'Testlər';

  @override
  String get ringNeeds => 'Ehtiyaclar';

  @override
  String get ringBag => 'Çanta';

  @override
  String get weightChange => 'Çəki dəyişimi';

  @override
  String get tools => 'Alətlər';

  @override
  String get toolWeight => 'Çəki izləmə';

  @override
  String get toolMedicine => 'Dərman izləmə';

  @override
  String get toolKick => 'Təpik sayğacı';

  @override
  String get toolContraction => 'Sancı sayğacı';

  @override
  String get toolNeeds => 'Ehtiyac siyahısı';

  @override
  String get toolBag => 'Doğuş çantası';

  @override
  String get toolTests => 'Sağlamlıq testləri';

  @override
  String get toolNames => 'Ad tap';

  @override
  String get toolAlbum => 'Foto albom';

  @override
  String get suggest => 'Təklif göndər';

  @override
  String get rate => 'Qiymət ver';

  @override
  String get emailError => 'E-poçt tətbiqi açılmadı.';

  @override
  String get suggestSubject => 'Körpəm tətbiqi üçün təklif';

  @override
  String get suggestBody => 'Təklifiniz:';

  @override
  String get weightStart => 'Başlanğıc çəkiniz';

  @override
  String get weightToday => 'Bugünkü çəkiniz';

  @override
  String get weightHint => 'Məs. 62,5';

  @override
  String get kg => 'kq';

  @override
  String get weightAdd => 'Çəki əlavə et';

  @override
  String get weightClearTitle => 'Çəki məlumatları';

  @override
  String get weightClearMessage => 'Bütün çəki qeydləriniz silinəcək.';

  @override
  String get weightEmpty =>
      'Hələ qeyd yoxdur. Başlanğıc çəkinizi daxil edərək izləməyə başlayın.';

  @override
  String totalChange(String value) {
    return 'Ümumi dəyişim: $value kq';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week. həftə · $date';
  }

  @override
  String get medAdd => 'Dərman əlavə et';

  @override
  String get medEmpty =>
      'Dərmanlarınızı əlavə edin; hər gün seçdiyiniz saatda xatırladaq.';

  @override
  String get medNew => 'Yeni dərman';

  @override
  String get medEdit => 'Dərmanı redaktə et';

  @override
  String get medName => 'Dərmanın adı';

  @override
  String get medTime => 'Saat';

  @override
  String get medReminderOn => 'Xatırlatma açıq';

  @override
  String medDaily(String time, String meal) {
    return 'Hər gün $time · $meal';
  }

  @override
  String get mealEmpty => 'Ac qarına';

  @override
  String get mealFull => 'Tox qarına';

  @override
  String get mealAny => 'Fərq etməz';

  @override
  String notifTitle(String name) {
    return 'Dərman: $name';
  }

  @override
  String get notifEmpty => 'Ac qarına içməyi unutmayın';

  @override
  String get notifFull => 'Tox qarına içməyi unutmayın';

  @override
  String get notifAny => 'Dərman içmə vaxtıdır';

  @override
  String get notifChannel => 'Dərman xatırlatması';

  @override
  String get notifChannelDesc => 'Dərman saatlarında xatırlatma';

  @override
  String get notifPermissionDenied =>
      'Bildiriş icazəsi verilmədi; xatırlatma işləməyəcək.';

  @override
  String get kickIdle => 'təpik';

  @override
  String get kickTap => 'TƏPİK!';

  @override
  String get stopAndSave => 'Bitir və yadda saxla';

  @override
  String get kickHelp =>
      'Körpəniz hər dəfə hərəkət etdikdə dairəyə toxunun. Ümumi tövsiyə: 2 saat ərzində 10 hərəkət. Narahatlığınız olarsa həkiminizə müraciət edin.';

  @override
  String get kickEmpty => 'Qeydə alınmış seans yoxdur.';

  @override
  String kickRow(int count, String duration) {
    return '$count təpik · $duration';
  }

  @override
  String get contractionRunning => 'Sancı davam edir';

  @override
  String get contractionIdle => 'Sancı başlayanda toxunun';

  @override
  String get contractionStartBtn => 'BAŞLADI';

  @override
  String get contractionStopBtn => 'BİTDİ';

  @override
  String get contractionHelp =>
      'Sancılar müntəzəm və tezləşirsə (məs. 5 dəqiqədən bir, 1 dəqiqə davam edən), həkiminizə müraciət edin.';

  @override
  String get contractionEmpty => 'Qeydə alınmış sancı yoxdur.';

  @override
  String contractionDuration(String duration) {
    return 'Müddət $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'əvvəlki ilə arası $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Son 1 saat: $count sancı · orta hesabla $length davam edir, $minutes dəqiqədən bir';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total tamamlandı';
  }

  @override
  String get addItem => 'Maddə əlavə et';

  @override
  String get newItem => 'Yeni maddə';

  @override
  String get customGroup => 'Əlavə etdiklərim';

  @override
  String get testsDisclaimer =>
      'Bu siyahı ümumi məlumat xarakterlidir; sizə uyğun test təqvimi üçün həkiminizə müraciət edin.';

  @override
  String get namesTitle => 'Körpəmin adı';

  @override
  String get spinning => 'Çarx fırlanır…';

  @override
  String get namesHint => 'Çarxa toxunun və ya telefonu silkələyin';

  @override
  String get nameError => 'Ad tapılmadı.';

  @override
  String get shareAll => 'Hamısını paylaş';

  @override
  String get ultrasoundPhoto => 'USM şəkli';

  @override
  String get takePhoto => 'Şəkil çək';

  @override
  String get pickGallery => 'Qalereyadan seç';

  @override
  String get share => 'Paylaş';

  @override
  String get remove => 'Çıxar';

  @override
  String get photoError => 'Şəkil alınmadı. İcazələri yoxlayın.';

  @override
  String get addPhotosFirst => 'Əvvəlcə alboma şəkil əlavə edin.';

  @override
  String photoN(int n) {
    return '$n. şəkil';
  }

  @override
  String get shareText => 'Körpəmin USM şəkli';

  @override
  String get shareAllText => 'Körpəmin USM albomu';

  @override
  String get chartBaby => 'Körpə (təxmini)';

  @override
  String get chartMother => 'Ana';

  @override
  String get gram => 'q';

  @override
  String babyWeightNow(String value) {
    return 'Körpənin təxmini çəkisi: $value';
  }

  @override
  String get babyWeightTooEarly => 'Körpənin çəkisi 8-ci həftədən göstərilir.';

  @override
  String get babyWeightNote =>
      'Bunlar orta göstəricilərdir; hər körpə fərqli böyüyür. Həkiminizə müraciət edin.';

  @override
  String get babyBornQuestion => 'Körpəniz doğuldu? 🎉';

  @override
  String get babyBornAction => 'Körpəm doğuldu';

  @override
  String get babyBornTitle => 'Xoş gəldin, balaca!';

  @override
  String get birthDateLabel => 'Doğum tarixi';

  @override
  String get birthWeight => 'Doğum çəkisi (kq)';

  @override
  String get birthLength => 'Doğum boyu (sm)';

  @override
  String get optional => 'istəyə bağlı';

  @override
  String get backToPregnancy => 'Hamiləlik rejiminə qayıt';

  @override
  String get weeklyNotifSetting => 'Həftəlik bildirişlər';

  @override
  String get weeklyNotifChannel => 'Həftəlik məlumat';

  @override
  String weeklyNotifTitle(int week) {
    return '$week. həftəyə xoş gəldiniz 💕';
  }

  @override
  String get weeklyNotifBody => 'Bu həftənin məlumatı hazırdır.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name $month aylıq oldu! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Bu ayın inkişafına baxın.';

  @override
  String babyAge(int months, int days) {
    return '$months ay $days gün';
  }

  @override
  String monthTitle(int month) {
    return '$month. ay inkişafı';
  }

  @override
  String get newbornTitle => 'Yenidoğan dövrü';

  @override
  String get showMore => 'Davamını oxu';

  @override
  String get lastFeeding => 'son qidalanma';

  @override
  String get diapersToday => 'bugünkü bez';

  @override
  String get sleepToday => 'bugünkü yuxu';

  @override
  String agoHM(int h, int m) {
    return '$h saat $m dəq əvvəl';
  }

  @override
  String agoM(int m) {
    return '$m dəq əvvəl';
  }

  @override
  String durationHM(int h, int m) {
    return '$h saat $m dəq';
  }

  @override
  String get toolFeeding => 'Qidalanma';

  @override
  String get toolDiaper => 'Bez';

  @override
  String get toolSleep => 'Yuxu';

  @override
  String get toolGrowth => 'İnkişaf';

  @override
  String get breastLeft => 'Sol';

  @override
  String get breastRight => 'Sağ';

  @override
  String get bottle => 'Butılka';

  @override
  String get solid => 'Əlavə qida';

  @override
  String get tapToStop => 'Bitirmək üçün eyni tərəfə yenidən toxunun';

  @override
  String get bottleAmount => 'Butılka miqdarı';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Bu gün';

  @override
  String feedCount(int count) {
    return '$count qidalanma';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Əmizdirmə $minutes dəq';
  }

  @override
  String bottleTotal(int ml) {
    return 'Butılka $ml ml';
  }

  @override
  String get diaperWet => 'Yaş';

  @override
  String get diaperDirty => 'Çirkli';

  @override
  String get diaperBoth => 'Hər ikisi';

  @override
  String diaperCount(int count) {
    return '$count bez';
  }

  @override
  String get sleepStart => 'Yuxuya getdi';

  @override
  String get sleepStop => 'Oyandı';

  @override
  String get sleepRunning => 'Yatır';

  @override
  String sleepTotal(String duration) {
    return 'Bu gün cəmi $duration';
  }

  @override
  String get growthAdd => 'Ölçü əlavə et';

  @override
  String get growthWeight => 'Çəki (kq)';

  @override
  String get growthLength => 'Boy (sm)';

  @override
  String get growthHead => 'Baş çevrəsi (sm)';

  @override
  String get growthHeadShort => 'Baş';

  @override
  String get growthEmpty =>
      'Hələ ölçü yoxdur. Həkim yoxlamalarındakı dəyərləri əlavə edin.';

  @override
  String get whoMedian => 'ÜST ortalaması';

  @override
  String get babyWeightLabel => 'Körpənin çəkisi';

  @override
  String monthAxis(int month) {
    return '$month ay';
  }

  @override
  String get otherTools => 'Digər alətlər';

  @override
  String get noRecords => 'Hələ qeyd yoxdur.';

  @override
  String get dailyMsgSetting => 'Sabahınız xeyir mesajları';
}
