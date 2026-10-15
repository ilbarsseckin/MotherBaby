// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class LTr extends L {
  LTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Bebeğim';

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get delete => 'Sil';

  @override
  String get add => 'Ekle';

  @override
  String get deleteAll => 'Tümünü sil';

  @override
  String get saved => 'Kaydedildi';

  @override
  String get swipeToDelete => 'Silmek için sola kaydırın.';

  @override
  String get history => 'Geçmiş';

  @override
  String get start => 'Başlat';

  @override
  String weekAxis(int week) {
    return '$week. hf';
  }

  @override
  String get welcomeTitle => 'Hoş geldiniz';

  @override
  String get welcomeSubtitle =>
      'Hamileliğinizi hafta hafta takip etmek için birkaç bilgiye ihtiyacımız var.';

  @override
  String get babyName => 'Bebeğin adı';

  @override
  String get sexLabel => 'Cinsiyeti';

  @override
  String get sexGirl => 'Kız';

  @override
  String get sexBoy => 'Erkek';

  @override
  String get sexUnknown => 'Belli değil';

  @override
  String get kinLabel => 'Siz bebeğin...';

  @override
  String get kinMother => 'Annesi';

  @override
  String get kinFather => 'Babası';

  @override
  String get kinAuntMaternal => 'Teyzesi';

  @override
  String get kinAuntPaternal => 'Halası';

  @override
  String get kinUncleMaternal => 'Dayısı';

  @override
  String get kinUnclePaternal => 'Amcası';

  @override
  String get kinSibling => 'Kardeşi';

  @override
  String get kinGrandmother => 'Büyükannesi';

  @override
  String get kinGrandfather => 'Büyükbabası';

  @override
  String get kinOther => 'Yakını';

  @override
  String get whichDate => 'Hangi tarihi biliyorsunuz?';

  @override
  String get lastPeriod => 'Son adet';

  @override
  String get dueDateShort => 'Tahmini doğum';

  @override
  String get lastPeriodLong => 'Son adet başlangıç günü';

  @override
  String get dueDateLong => 'Tahmini doğum tarihi';

  @override
  String get tapToSelect => 'Seçmek için dokunun';

  @override
  String profilePreview(String date, int week, int day) {
    return 'Tahmini doğum: $date · $week. hafta $day. gün';
  }

  @override
  String get begin => 'Başla';

  @override
  String get nameRequired => 'Lütfen bebeğinize bir isim (ya da lakap) yazın.';

  @override
  String get dateRequired => 'Lütfen tarihi seçin.';

  @override
  String get settings => 'Ayarlar';

  @override
  String get language => 'Dil';

  @override
  String get languageSystem => 'Telefonun dili';

  @override
  String get privacyOptions => 'Reklam gizlilik seçenekleri';

  @override
  String get factoryReset => 'Fabrika ayarlarına dön';

  @override
  String get factoryResetTitle => 'Fabrika ayarları';

  @override
  String get factoryResetMessage =>
      'Kilo, ilaç, sayaç, liste ve fotoğraf verilerinizin tümü silinecek. Emin misiniz?';

  @override
  String weekDay(int week, int day) {
    return '$week. hafta $day. gün';
  }

  @override
  String trimester(int n) {
    return '$n. trimester';
  }

  @override
  String get daysPassed => 'geçen gün';

  @override
  String get daysLeft => 'kalan gün';

  @override
  String get dueDate => 'tahmini doğum';

  @override
  String get babyToday => 'Bebeğim bugün';

  @override
  String get motherToday => 'Anne bugün';

  @override
  String dailyBabyTitle(int week) {
    return '$week. hafta bebeğim';
  }

  @override
  String dailyMotherTitle(int week) {
    return 'Anne · $week. hafta';
  }

  @override
  String get noInfoToday => 'Bugün için bilgi bulunamadı.';

  @override
  String get ringBirth => 'Doğuma';

  @override
  String get ringTests => 'Testler';

  @override
  String get ringNeeds => 'İhtiyaçlar';

  @override
  String get ringBag => 'Çanta';

  @override
  String get weightChange => 'Kilo değişimi';

  @override
  String get tools => 'Araçlar';

  @override
  String get toolWeight => 'Kilo Takip';

  @override
  String get toolMedicine => 'İlaç Takip';

  @override
  String get toolKick => 'Tekme Sayar';

  @override
  String get toolContraction => 'Kasılma Sayar';

  @override
  String get toolNeeds => 'İhtiyaç Listesi';

  @override
  String get toolBag => 'Doğum Çantası';

  @override
  String get toolTests => 'Sağlık Testleri';

  @override
  String get toolNames => 'İsim Bul';

  @override
  String get toolAlbum => 'Foto Albüm';

  @override
  String get suggest => 'Öneri gönder';

  @override
  String get rate => 'Puan ver';

  @override
  String get emailError => 'E-posta uygulaması açılamadı.';

  @override
  String get suggestSubject => 'Bebeğim uygulaması önerisi';

  @override
  String get suggestBody => 'Öneriniz:';

  @override
  String get weightStart => 'Başlangıç kilonuz';

  @override
  String get weightToday => 'Bugünkü kilonuz';

  @override
  String get weightHint => 'Örn. 62,5';

  @override
  String get kg => 'kg';

  @override
  String get weightAdd => 'Kilo ekle';

  @override
  String get weightClearTitle => 'Kilo verileri';

  @override
  String get weightClearMessage => 'Tüm kilo kayıtlarınız silinecek.';

  @override
  String get weightEmpty =>
      'Henüz kayıt yok. Başlangıç kilonuzu girerek takibe başlayın.';

  @override
  String totalChange(String value) {
    return 'Toplam değişim: $value kg';
  }

  @override
  String weekAndDate(int week, String date) {
    return '$week. hafta · $date';
  }

  @override
  String get medAdd => 'İlaç ekle';

  @override
  String get medEmpty =>
      'İlaçlarınızı ekleyin; her gün seçtiğiniz saatte hatırlatalım.';

  @override
  String get medNew => 'Yeni ilaç';

  @override
  String get medEdit => 'İlacı düzenle';

  @override
  String get medName => 'İlaç adı';

  @override
  String get medTime => 'Saat';

  @override
  String get medReminderOn => 'Hatırlatıcı açık';

  @override
  String medDaily(String time, String meal) {
    return 'Her gün $time · $meal';
  }

  @override
  String get mealEmpty => 'Aç karnına';

  @override
  String get mealFull => 'Tok karnına';

  @override
  String get mealAny => 'Fark etmez';

  @override
  String notifTitle(String name) {
    return 'İlaç: $name';
  }

  @override
  String get notifEmpty => 'Aç karnına içmeyi unutmayın';

  @override
  String get notifFull => 'Tok karnına içmeyi unutmayın';

  @override
  String get notifAny => 'İlaç içme zamanı';

  @override
  String get notifChannel => 'İlaç hatırlatıcı';

  @override
  String get notifChannelDesc => 'İlaç saatlerinde hatırlatma';

  @override
  String get notifPermissionDenied =>
      'Bildirim izni verilmedi; hatırlatıcı çalmayacak.';

  @override
  String get kickIdle => 'tekme';

  @override
  String get kickTap => 'TEKME!';

  @override
  String get stopAndSave => 'Bitir ve kaydet';

  @override
  String get kickHelp =>
      'Bebeğiniz her hareket ettiğinde daireye dokunun. Genel öneri: 2 saat içinde 10 hareket. Endişeniz olursa doktorunuza danışın.';

  @override
  String get kickEmpty => 'Kayıtlı oturum yok.';

  @override
  String kickRow(int count, String duration) {
    return '$count tekme · $duration';
  }

  @override
  String get contractionRunning => 'Kasılma sürüyor';

  @override
  String get contractionIdle => 'Kasılma başlayınca dokunun';

  @override
  String get contractionStartBtn => 'BAŞLADI';

  @override
  String get contractionStopBtn => 'BİTTİ';

  @override
  String get contractionHelp =>
      'Kasılmalar düzenli ve sıklaşıyorsa (ör. 5 dakikada bir, 1 dakika süren) doktorunuza başvurun.';

  @override
  String get contractionEmpty => 'Kayıtlı kasılma yok.';

  @override
  String contractionDuration(String duration) {
    return 'Süre $duration';
  }

  @override
  String contractionGap(String duration) {
    return 'önceki ile arası $duration';
  }

  @override
  String contractionSummary(int count, String length, String minutes) {
    return 'Son 1 saat: $count kasılma · ortalama $length sürüyor, $minutes dakikada bir';
  }

  @override
  String progressLabel(int done, int total) {
    return '$done / $total tamamlandı';
  }

  @override
  String get addItem => 'Madde ekle';

  @override
  String get newItem => 'Yeni madde';

  @override
  String get customGroup => 'Eklediklerim';

  @override
  String get testsDisclaimer =>
      'Bu liste genel bilgilendirme amaçlıdır; size özel test takvimi için doktorunuza danışın.';

  @override
  String get namesTitle => 'Bebeğimin İsmi';

  @override
  String get spinning => 'Çark dönüyor…';

  @override
  String get namesHint => 'Çarka dokunun ya da telefonu sallayın';

  @override
  String get nameError => 'İsim alınamadı.';

  @override
  String get shareAll => 'Tümünü paylaş';

  @override
  String get ultrasoundPhoto => 'Ultrason fotoğrafı';

  @override
  String get takePhoto => 'Fotoğraf çek';

  @override
  String get pickGallery => 'Galeriden seç';

  @override
  String get share => 'Paylaş';

  @override
  String get remove => 'Kaldır';

  @override
  String get photoError => 'Fotoğraf alınamadı. İzinleri kontrol edin.';

  @override
  String get addPhotosFirst => 'Önce albüme fotoğraf ekleyin.';

  @override
  String photoN(int n) {
    return '$n. fotoğraf';
  }

  @override
  String get shareText => 'Bebeğimin ultrason fotoğrafı';

  @override
  String get shareAllText => 'Bebeğimin ultrason albümü';

  @override
  String get chartBaby => 'Bebek (tahmini)';

  @override
  String get chartMother => 'Anne';

  @override
  String get gram => 'g';

  @override
  String babyWeightNow(String value) {
    return 'Bebeğin tahmini ağırlığı: $value';
  }

  @override
  String get babyWeightTooEarly =>
      'Bebeğin ağırlığı 8. haftadan itibaren gösterilir.';

  @override
  String get babyWeightNote =>
      'Ortalama değerlerdir; her bebek farklı gelişir. Doğru bilgi için doktorunuza danışın.';

  @override
  String get babyBornQuestion => 'Bebeğiniz doğdu mu? 🎉';

  @override
  String get babyBornAction => 'Bebeğim doğdu';

  @override
  String get babyBornTitle => 'Hoş geldin bebek!';

  @override
  String get birthDateLabel => 'Doğum tarihi';

  @override
  String get birthWeight => 'Doğum kilosu (kg)';

  @override
  String get birthLength => 'Doğum boyu (cm)';

  @override
  String get optional => 'isteğe bağlı';

  @override
  String get backToPregnancy => 'Hamilelik moduna dön';

  @override
  String get weeklyNotifSetting => 'Haftalık bilgilendirme bildirimleri';

  @override
  String get weeklyNotifChannel => 'Haftalık bilgilendirme';

  @override
  String weeklyNotifTitle(int week) {
    return '$week. haftaya girdiniz 💕';
  }

  @override
  String get weeklyNotifBody => 'Bu haftanın bilgileri hazır.';

  @override
  String monthlyNotifTitle(String name, int month) {
    return '$name $month aylık oldu! 🎉';
  }

  @override
  String get monthlyNotifBody => 'Bu ayın gelişim bilgilerine göz atın.';

  @override
  String babyAge(int months, int days) {
    return '$months ay $days gün';
  }

  @override
  String monthTitle(int month) {
    return '$month. ay gelişimi';
  }

  @override
  String get newbornTitle => 'Yenidoğan dönemi';

  @override
  String get showMore => 'Devamını oku';

  @override
  String get lastFeeding => 'son beslenme';

  @override
  String get diapersToday => 'bugünkü bez';

  @override
  String get sleepToday => 'bugünkü uyku';

  @override
  String agoHM(int h, int m) {
    return '$h sa $m dk önce';
  }

  @override
  String agoM(int m) {
    return '$m dk önce';
  }

  @override
  String durationHM(int h, int m) {
    return '$h sa $m dk';
  }

  @override
  String get toolFeeding => 'Beslenme';

  @override
  String get toolDiaper => 'Bez';

  @override
  String get toolSleep => 'Uyku';

  @override
  String get toolGrowth => 'Büyüme';

  @override
  String get breastLeft => 'Sol';

  @override
  String get breastRight => 'Sağ';

  @override
  String get bottle => 'Biberon';

  @override
  String get solid => 'Ek gıda';

  @override
  String get tapToStop => 'Bitirmek için aynı tarafa tekrar dokunun';

  @override
  String get bottleAmount => 'Biberon miktarı';

  @override
  String get ml => 'ml';

  @override
  String get todaySummary => 'Bugün';

  @override
  String feedCount(int count) {
    return '$count beslenme';
  }

  @override
  String breastMinutes(int minutes) {
    return 'Emzirme $minutes dk';
  }

  @override
  String bottleTotal(int ml) {
    return 'Biberon $ml ml';
  }

  @override
  String get diaperWet => 'Islak';

  @override
  String get diaperDirty => 'Kirli';

  @override
  String get diaperBoth => 'İkisi de';

  @override
  String diaperCount(int count) {
    return '$count bez';
  }

  @override
  String get sleepStart => 'Uyudu';

  @override
  String get sleepStop => 'Uyandı';

  @override
  String get sleepRunning => 'Uyuyor';

  @override
  String sleepTotal(String duration) {
    return 'Bugün toplam $duration';
  }

  @override
  String get growthAdd => 'Ölçüm ekle';

  @override
  String get growthWeight => 'Ağırlık (kg)';

  @override
  String get growthLength => 'Boy (cm)';

  @override
  String get growthHead => 'Baş çevresi (cm)';

  @override
  String get growthHeadShort => 'Baş';

  @override
  String get growthEmpty =>
      'Henüz ölçüm yok. Doktor kontrollerinde ölçülen değerleri ekleyin.';

  @override
  String get whoMedian => 'DSÖ ortalaması';

  @override
  String get babyWeightLabel => 'Bebeğin kilosu';

  @override
  String monthAxis(int month) {
    return '$month. ay';
  }

  @override
  String get otherTools => 'Diğer araçlar';

  @override
  String get noRecords => 'Henüz kayıt yok.';

  @override
  String get dailyMsgSetting => 'Günaydın mesajları';
}
