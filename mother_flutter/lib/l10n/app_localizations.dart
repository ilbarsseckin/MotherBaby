import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('az'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğim'**
  String get appTitle;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get delete;

  /// No description provided for @add.
  ///
  /// In tr, this message translates to:
  /// **'Ekle'**
  String get add;

  /// No description provided for @deleteAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü sil'**
  String get deleteAll;

  /// No description provided for @saved.
  ///
  /// In tr, this message translates to:
  /// **'Kaydedildi'**
  String get saved;

  /// No description provided for @swipeToDelete.
  ///
  /// In tr, this message translates to:
  /// **'Silmek için sola kaydırın.'**
  String get swipeToDelete;

  /// No description provided for @history.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş'**
  String get history;

  /// No description provided for @start.
  ///
  /// In tr, this message translates to:
  /// **'Başlat'**
  String get start;

  /// No description provided for @weekAxis.
  ///
  /// In tr, this message translates to:
  /// **'{week}. hf'**
  String weekAxis(int week);

  /// No description provided for @welcomeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hamileliğinizi hafta hafta takip etmek için birkaç bilgiye ihtiyacımız var.'**
  String get welcomeSubtitle;

  /// No description provided for @babyName.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğin adı'**
  String get babyName;

  /// No description provided for @sexLabel.
  ///
  /// In tr, this message translates to:
  /// **'Cinsiyeti'**
  String get sexLabel;

  /// No description provided for @sexGirl.
  ///
  /// In tr, this message translates to:
  /// **'Kız'**
  String get sexGirl;

  /// No description provided for @sexBoy.
  ///
  /// In tr, this message translates to:
  /// **'Erkek'**
  String get sexBoy;

  /// No description provided for @sexUnknown.
  ///
  /// In tr, this message translates to:
  /// **'Belli değil'**
  String get sexUnknown;

  /// No description provided for @kinLabel.
  ///
  /// In tr, this message translates to:
  /// **'Siz bebeğin...'**
  String get kinLabel;

  /// No description provided for @kinMother.
  ///
  /// In tr, this message translates to:
  /// **'Annesi'**
  String get kinMother;

  /// No description provided for @kinFather.
  ///
  /// In tr, this message translates to:
  /// **'Babası'**
  String get kinFather;

  /// No description provided for @kinAuntMaternal.
  ///
  /// In tr, this message translates to:
  /// **'Teyzesi'**
  String get kinAuntMaternal;

  /// No description provided for @kinAuntPaternal.
  ///
  /// In tr, this message translates to:
  /// **'Halası'**
  String get kinAuntPaternal;

  /// No description provided for @kinUncleMaternal.
  ///
  /// In tr, this message translates to:
  /// **'Dayısı'**
  String get kinUncleMaternal;

  /// No description provided for @kinUnclePaternal.
  ///
  /// In tr, this message translates to:
  /// **'Amcası'**
  String get kinUnclePaternal;

  /// No description provided for @kinSibling.
  ///
  /// In tr, this message translates to:
  /// **'Kardeşi'**
  String get kinSibling;

  /// No description provided for @kinGrandmother.
  ///
  /// In tr, this message translates to:
  /// **'Büyükannesi'**
  String get kinGrandmother;

  /// No description provided for @kinGrandfather.
  ///
  /// In tr, this message translates to:
  /// **'Büyükbabası'**
  String get kinGrandfather;

  /// No description provided for @kinOther.
  ///
  /// In tr, this message translates to:
  /// **'Yakını'**
  String get kinOther;

  /// No description provided for @whichDate.
  ///
  /// In tr, this message translates to:
  /// **'Hangi tarihi biliyorsunuz?'**
  String get whichDate;

  /// No description provided for @lastPeriod.
  ///
  /// In tr, this message translates to:
  /// **'Son adet'**
  String get lastPeriod;

  /// No description provided for @dueDateShort.
  ///
  /// In tr, this message translates to:
  /// **'Tahmini doğum'**
  String get dueDateShort;

  /// No description provided for @lastPeriodLong.
  ///
  /// In tr, this message translates to:
  /// **'Son adet başlangıç günü'**
  String get lastPeriodLong;

  /// No description provided for @dueDateLong.
  ///
  /// In tr, this message translates to:
  /// **'Tahmini doğum tarihi'**
  String get dueDateLong;

  /// No description provided for @tapToSelect.
  ///
  /// In tr, this message translates to:
  /// **'Seçmek için dokunun'**
  String get tapToSelect;

  /// No description provided for @profilePreview.
  ///
  /// In tr, this message translates to:
  /// **'Tahmini doğum: {date} · {week}. hafta {day}. gün'**
  String profilePreview(String date, int week, int day);

  /// No description provided for @begin.
  ///
  /// In tr, this message translates to:
  /// **'Başla'**
  String get begin;

  /// No description provided for @nameRequired.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen bebeğinize bir isim (ya da lakap) yazın.'**
  String get nameRequired;

  /// No description provided for @dateRequired.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen tarihi seçin.'**
  String get dateRequired;

  /// No description provided for @settings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In tr, this message translates to:
  /// **'Telefonun dili'**
  String get languageSystem;

  /// No description provided for @privacyOptions.
  ///
  /// In tr, this message translates to:
  /// **'Reklam gizlilik seçenekleri'**
  String get privacyOptions;

  /// No description provided for @factoryReset.
  ///
  /// In tr, this message translates to:
  /// **'Fabrika ayarlarına dön'**
  String get factoryReset;

  /// No description provided for @factoryResetTitle.
  ///
  /// In tr, this message translates to:
  /// **'Fabrika ayarları'**
  String get factoryResetTitle;

  /// No description provided for @factoryResetMessage.
  ///
  /// In tr, this message translates to:
  /// **'Kilo, ilaç, sayaç, liste ve fotoğraf verilerinizin tümü silinecek. Emin misiniz?'**
  String get factoryResetMessage;

  /// No description provided for @weekDay.
  ///
  /// In tr, this message translates to:
  /// **'{week}. hafta {day}. gün'**
  String weekDay(int week, int day);

  /// No description provided for @trimester.
  ///
  /// In tr, this message translates to:
  /// **'{n}. trimester'**
  String trimester(int n);

  /// No description provided for @daysPassed.
  ///
  /// In tr, this message translates to:
  /// **'geçen gün'**
  String get daysPassed;

  /// No description provided for @daysLeft.
  ///
  /// In tr, this message translates to:
  /// **'kalan gün'**
  String get daysLeft;

  /// No description provided for @dueDate.
  ///
  /// In tr, this message translates to:
  /// **'tahmini doğum'**
  String get dueDate;

  /// No description provided for @babyToday.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğim bugün'**
  String get babyToday;

  /// No description provided for @motherToday.
  ///
  /// In tr, this message translates to:
  /// **'Anne bugün'**
  String get motherToday;

  /// No description provided for @dailyBabyTitle.
  ///
  /// In tr, this message translates to:
  /// **'{week}. hafta bebeğim'**
  String dailyBabyTitle(int week);

  /// No description provided for @dailyMotherTitle.
  ///
  /// In tr, this message translates to:
  /// **'Anne · {week}. hafta'**
  String dailyMotherTitle(int week);

  /// No description provided for @noInfoToday.
  ///
  /// In tr, this message translates to:
  /// **'Bugün için bilgi bulunamadı.'**
  String get noInfoToday;

  /// No description provided for @ringBirth.
  ///
  /// In tr, this message translates to:
  /// **'Doğuma'**
  String get ringBirth;

  /// No description provided for @ringTests.
  ///
  /// In tr, this message translates to:
  /// **'Testler'**
  String get ringTests;

  /// No description provided for @ringNeeds.
  ///
  /// In tr, this message translates to:
  /// **'İhtiyaçlar'**
  String get ringNeeds;

  /// No description provided for @ringBag.
  ///
  /// In tr, this message translates to:
  /// **'Çanta'**
  String get ringBag;

  /// No description provided for @weightChange.
  ///
  /// In tr, this message translates to:
  /// **'Kilo değişimi'**
  String get weightChange;

  /// No description provided for @tools.
  ///
  /// In tr, this message translates to:
  /// **'Araçlar'**
  String get tools;

  /// No description provided for @toolWeight.
  ///
  /// In tr, this message translates to:
  /// **'Kilo Takip'**
  String get toolWeight;

  /// No description provided for @toolMedicine.
  ///
  /// In tr, this message translates to:
  /// **'İlaç Takip'**
  String get toolMedicine;

  /// No description provided for @toolKick.
  ///
  /// In tr, this message translates to:
  /// **'Tekme Sayar'**
  String get toolKick;

  /// No description provided for @toolContraction.
  ///
  /// In tr, this message translates to:
  /// **'Kasılma Sayar'**
  String get toolContraction;

  /// No description provided for @toolNeeds.
  ///
  /// In tr, this message translates to:
  /// **'İhtiyaç Listesi'**
  String get toolNeeds;

  /// No description provided for @toolBag.
  ///
  /// In tr, this message translates to:
  /// **'Doğum Çantası'**
  String get toolBag;

  /// No description provided for @toolTests.
  ///
  /// In tr, this message translates to:
  /// **'Sağlık Testleri'**
  String get toolTests;

  /// No description provided for @toolNames.
  ///
  /// In tr, this message translates to:
  /// **'İsim Bul'**
  String get toolNames;

  /// No description provided for @toolAlbum.
  ///
  /// In tr, this message translates to:
  /// **'Foto Albüm'**
  String get toolAlbum;

  /// No description provided for @suggest.
  ///
  /// In tr, this message translates to:
  /// **'Öneri gönder'**
  String get suggest;

  /// No description provided for @rate.
  ///
  /// In tr, this message translates to:
  /// **'Puan ver'**
  String get rate;

  /// No description provided for @emailError.
  ///
  /// In tr, this message translates to:
  /// **'E-posta uygulaması açılamadı.'**
  String get emailError;

  /// No description provided for @suggestSubject.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğim uygulaması önerisi'**
  String get suggestSubject;

  /// No description provided for @suggestBody.
  ///
  /// In tr, this message translates to:
  /// **'Öneriniz:'**
  String get suggestBody;

  /// No description provided for @weightStart.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç kilonuz'**
  String get weightStart;

  /// No description provided for @weightToday.
  ///
  /// In tr, this message translates to:
  /// **'Bugünkü kilonuz'**
  String get weightToday;

  /// No description provided for @weightHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn. 62,5'**
  String get weightHint;

  /// No description provided for @kg.
  ///
  /// In tr, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @weightAdd.
  ///
  /// In tr, this message translates to:
  /// **'Kilo ekle'**
  String get weightAdd;

  /// No description provided for @weightClearTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kilo verileri'**
  String get weightClearTitle;

  /// No description provided for @weightClearMessage.
  ///
  /// In tr, this message translates to:
  /// **'Tüm kilo kayıtlarınız silinecek.'**
  String get weightClearMessage;

  /// No description provided for @weightEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıt yok. Başlangıç kilonuzu girerek takibe başlayın.'**
  String get weightEmpty;

  /// No description provided for @totalChange.
  ///
  /// In tr, this message translates to:
  /// **'Toplam değişim: {value} kg'**
  String totalChange(String value);

  /// No description provided for @weekAndDate.
  ///
  /// In tr, this message translates to:
  /// **'{week}. hafta · {date}'**
  String weekAndDate(int week, String date);

  /// No description provided for @medAdd.
  ///
  /// In tr, this message translates to:
  /// **'İlaç ekle'**
  String get medAdd;

  /// No description provided for @medEmpty.
  ///
  /// In tr, this message translates to:
  /// **'İlaçlarınızı ekleyin; her gün seçtiğiniz saatte hatırlatalım.'**
  String get medEmpty;

  /// No description provided for @medNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni ilaç'**
  String get medNew;

  /// No description provided for @medEdit.
  ///
  /// In tr, this message translates to:
  /// **'İlacı düzenle'**
  String get medEdit;

  /// No description provided for @medName.
  ///
  /// In tr, this message translates to:
  /// **'İlaç adı'**
  String get medName;

  /// No description provided for @medTime.
  ///
  /// In tr, this message translates to:
  /// **'Saat'**
  String get medTime;

  /// No description provided for @medReminderOn.
  ///
  /// In tr, this message translates to:
  /// **'Hatırlatıcı açık'**
  String get medReminderOn;

  /// No description provided for @medDaily.
  ///
  /// In tr, this message translates to:
  /// **'Her gün {time} · {meal}'**
  String medDaily(String time, String meal);

  /// No description provided for @mealEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Aç karnına'**
  String get mealEmpty;

  /// No description provided for @mealFull.
  ///
  /// In tr, this message translates to:
  /// **'Tok karnına'**
  String get mealFull;

  /// No description provided for @mealAny.
  ///
  /// In tr, this message translates to:
  /// **'Fark etmez'**
  String get mealAny;

  /// No description provided for @notifTitle.
  ///
  /// In tr, this message translates to:
  /// **'İlaç: {name}'**
  String notifTitle(String name);

  /// No description provided for @notifEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Aç karnına içmeyi unutmayın'**
  String get notifEmpty;

  /// No description provided for @notifFull.
  ///
  /// In tr, this message translates to:
  /// **'Tok karnına içmeyi unutmayın'**
  String get notifFull;

  /// No description provided for @notifAny.
  ///
  /// In tr, this message translates to:
  /// **'İlaç içme zamanı'**
  String get notifAny;

  /// No description provided for @notifChannel.
  ///
  /// In tr, this message translates to:
  /// **'İlaç hatırlatıcı'**
  String get notifChannel;

  /// No description provided for @notifChannelDesc.
  ///
  /// In tr, this message translates to:
  /// **'İlaç saatlerinde hatırlatma'**
  String get notifChannelDesc;

  /// No description provided for @notifPermissionDenied.
  ///
  /// In tr, this message translates to:
  /// **'Bildirim izni verilmedi; hatırlatıcı çalmayacak.'**
  String get notifPermissionDenied;

  /// No description provided for @kickIdle.
  ///
  /// In tr, this message translates to:
  /// **'tekme'**
  String get kickIdle;

  /// No description provided for @kickTap.
  ///
  /// In tr, this message translates to:
  /// **'TEKME!'**
  String get kickTap;

  /// No description provided for @stopAndSave.
  ///
  /// In tr, this message translates to:
  /// **'Bitir ve kaydet'**
  String get stopAndSave;

  /// No description provided for @kickHelp.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğiniz her hareket ettiğinde daireye dokunun. Genel öneri: 2 saat içinde 10 hareket. Endişeniz olursa doktorunuza danışın.'**
  String get kickHelp;

  /// No description provided for @kickEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı oturum yok.'**
  String get kickEmpty;

  /// No description provided for @kickRow.
  ///
  /// In tr, this message translates to:
  /// **'{count} tekme · {duration}'**
  String kickRow(int count, String duration);

  /// No description provided for @contractionRunning.
  ///
  /// In tr, this message translates to:
  /// **'Kasılma sürüyor'**
  String get contractionRunning;

  /// No description provided for @contractionIdle.
  ///
  /// In tr, this message translates to:
  /// **'Kasılma başlayınca dokunun'**
  String get contractionIdle;

  /// No description provided for @contractionStartBtn.
  ///
  /// In tr, this message translates to:
  /// **'BAŞLADI'**
  String get contractionStartBtn;

  /// No description provided for @contractionStopBtn.
  ///
  /// In tr, this message translates to:
  /// **'BİTTİ'**
  String get contractionStopBtn;

  /// No description provided for @contractionHelp.
  ///
  /// In tr, this message translates to:
  /// **'Kasılmalar düzenli ve sıklaşıyorsa (ör. 5 dakikada bir, 1 dakika süren) doktorunuza başvurun.'**
  String get contractionHelp;

  /// No description provided for @contractionEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı kasılma yok.'**
  String get contractionEmpty;

  /// No description provided for @contractionDuration.
  ///
  /// In tr, this message translates to:
  /// **'Süre {duration}'**
  String contractionDuration(String duration);

  /// No description provided for @contractionGap.
  ///
  /// In tr, this message translates to:
  /// **'önceki ile arası {duration}'**
  String contractionGap(String duration);

  /// No description provided for @contractionSummary.
  ///
  /// In tr, this message translates to:
  /// **'Son 1 saat: {count} kasılma · ortalama {length} sürüyor, {minutes} dakikada bir'**
  String contractionSummary(int count, String length, String minutes);

  /// No description provided for @progressLabel.
  ///
  /// In tr, this message translates to:
  /// **'{done} / {total} tamamlandı'**
  String progressLabel(int done, int total);

  /// No description provided for @addItem.
  ///
  /// In tr, this message translates to:
  /// **'Madde ekle'**
  String get addItem;

  /// No description provided for @newItem.
  ///
  /// In tr, this message translates to:
  /// **'Yeni madde'**
  String get newItem;

  /// No description provided for @customGroup.
  ///
  /// In tr, this message translates to:
  /// **'Eklediklerim'**
  String get customGroup;

  /// No description provided for @testsDisclaimer.
  ///
  /// In tr, this message translates to:
  /// **'Bu liste genel bilgilendirme amaçlıdır; size özel test takvimi için doktorunuza danışın.'**
  String get testsDisclaimer;

  /// No description provided for @namesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğimin İsmi'**
  String get namesTitle;

  /// No description provided for @spinning.
  ///
  /// In tr, this message translates to:
  /// **'Çark dönüyor…'**
  String get spinning;

  /// No description provided for @namesHint.
  ///
  /// In tr, this message translates to:
  /// **'Çarka dokunun ya da telefonu sallayın'**
  String get namesHint;

  /// No description provided for @nameError.
  ///
  /// In tr, this message translates to:
  /// **'İsim alınamadı.'**
  String get nameError;

  /// No description provided for @shareAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü paylaş'**
  String get shareAll;

  /// No description provided for @ultrasoundPhoto.
  ///
  /// In tr, this message translates to:
  /// **'Ultrason fotoğrafı'**
  String get ultrasoundPhoto;

  /// No description provided for @takePhoto.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraf çek'**
  String get takePhoto;

  /// No description provided for @pickGallery.
  ///
  /// In tr, this message translates to:
  /// **'Galeriden seç'**
  String get pickGallery;

  /// No description provided for @share.
  ///
  /// In tr, this message translates to:
  /// **'Paylaş'**
  String get share;

  /// No description provided for @remove.
  ///
  /// In tr, this message translates to:
  /// **'Kaldır'**
  String get remove;

  /// No description provided for @photoError.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraf alınamadı. İzinleri kontrol edin.'**
  String get photoError;

  /// No description provided for @addPhotosFirst.
  ///
  /// In tr, this message translates to:
  /// **'Önce albüme fotoğraf ekleyin.'**
  String get addPhotosFirst;

  /// No description provided for @photoN.
  ///
  /// In tr, this message translates to:
  /// **'{n}. fotoğraf'**
  String photoN(int n);

  /// No description provided for @shareText.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğimin ultrason fotoğrafı'**
  String get shareText;

  /// No description provided for @shareAllText.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğimin ultrason albümü'**
  String get shareAllText;

  /// No description provided for @chartBaby.
  ///
  /// In tr, this message translates to:
  /// **'Bebek (tahmini)'**
  String get chartBaby;

  /// No description provided for @chartMother.
  ///
  /// In tr, this message translates to:
  /// **'Anne'**
  String get chartMother;

  /// No description provided for @gram.
  ///
  /// In tr, this message translates to:
  /// **'g'**
  String get gram;

  /// No description provided for @babyWeightNow.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğin tahmini ağırlığı: {value}'**
  String babyWeightNow(String value);

  /// No description provided for @babyWeightTooEarly.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğin ağırlığı 8. haftadan itibaren gösterilir.'**
  String get babyWeightTooEarly;

  /// No description provided for @babyWeightNote.
  ///
  /// In tr, this message translates to:
  /// **'Ortalama değerlerdir; her bebek farklı gelişir. Doğru bilgi için doktorunuza danışın.'**
  String get babyWeightNote;

  /// No description provided for @babyBornQuestion.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğiniz doğdu mu? 🎉'**
  String get babyBornQuestion;

  /// No description provided for @babyBornAction.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğim doğdu'**
  String get babyBornAction;

  /// No description provided for @babyBornTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldin bebek!'**
  String get babyBornTitle;

  /// No description provided for @birthDateLabel.
  ///
  /// In tr, this message translates to:
  /// **'Doğum tarihi'**
  String get birthDateLabel;

  /// No description provided for @birthWeight.
  ///
  /// In tr, this message translates to:
  /// **'Doğum kilosu (kg)'**
  String get birthWeight;

  /// No description provided for @birthLength.
  ///
  /// In tr, this message translates to:
  /// **'Doğum boyu (cm)'**
  String get birthLength;

  /// No description provided for @optional.
  ///
  /// In tr, this message translates to:
  /// **'isteğe bağlı'**
  String get optional;

  /// No description provided for @backToPregnancy.
  ///
  /// In tr, this message translates to:
  /// **'Hamilelik moduna dön'**
  String get backToPregnancy;

  /// No description provided for @weeklyNotifSetting.
  ///
  /// In tr, this message translates to:
  /// **'Haftalık bilgilendirme bildirimleri'**
  String get weeklyNotifSetting;

  /// No description provided for @weeklyNotifChannel.
  ///
  /// In tr, this message translates to:
  /// **'Haftalık bilgilendirme'**
  String get weeklyNotifChannel;

  /// No description provided for @weeklyNotifTitle.
  ///
  /// In tr, this message translates to:
  /// **'{week}. haftaya girdiniz 💕'**
  String weeklyNotifTitle(int week);

  /// No description provided for @weeklyNotifBody.
  ///
  /// In tr, this message translates to:
  /// **'Bu haftanın bilgileri hazır.'**
  String get weeklyNotifBody;

  /// No description provided for @monthlyNotifTitle.
  ///
  /// In tr, this message translates to:
  /// **'{name} {month} aylık oldu! 🎉'**
  String monthlyNotifTitle(String name, int month);

  /// No description provided for @monthlyNotifBody.
  ///
  /// In tr, this message translates to:
  /// **'Bu ayın gelişim bilgilerine göz atın.'**
  String get monthlyNotifBody;

  /// No description provided for @babyAge.
  ///
  /// In tr, this message translates to:
  /// **'{months} ay {days} gün'**
  String babyAge(int months, int days);

  /// No description provided for @monthTitle.
  ///
  /// In tr, this message translates to:
  /// **'{month}. ay gelişimi'**
  String monthTitle(int month);

  /// No description provided for @newbornTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yenidoğan dönemi'**
  String get newbornTitle;

  /// No description provided for @showMore.
  ///
  /// In tr, this message translates to:
  /// **'Devamını oku'**
  String get showMore;

  /// No description provided for @lastFeeding.
  ///
  /// In tr, this message translates to:
  /// **'son beslenme'**
  String get lastFeeding;

  /// No description provided for @diapersToday.
  ///
  /// In tr, this message translates to:
  /// **'bugünkü bez'**
  String get diapersToday;

  /// No description provided for @sleepToday.
  ///
  /// In tr, this message translates to:
  /// **'bugünkü uyku'**
  String get sleepToday;

  /// No description provided for @agoHM.
  ///
  /// In tr, this message translates to:
  /// **'{h} sa {m} dk önce'**
  String agoHM(int h, int m);

  /// No description provided for @agoM.
  ///
  /// In tr, this message translates to:
  /// **'{m} dk önce'**
  String agoM(int m);

  /// No description provided for @durationHM.
  ///
  /// In tr, this message translates to:
  /// **'{h} sa {m} dk'**
  String durationHM(int h, int m);

  /// No description provided for @toolFeeding.
  ///
  /// In tr, this message translates to:
  /// **'Beslenme'**
  String get toolFeeding;

  /// No description provided for @toolDiaper.
  ///
  /// In tr, this message translates to:
  /// **'Bez'**
  String get toolDiaper;

  /// No description provided for @toolSleep.
  ///
  /// In tr, this message translates to:
  /// **'Uyku'**
  String get toolSleep;

  /// No description provided for @toolGrowth.
  ///
  /// In tr, this message translates to:
  /// **'Büyüme'**
  String get toolGrowth;

  /// No description provided for @breastLeft.
  ///
  /// In tr, this message translates to:
  /// **'Sol'**
  String get breastLeft;

  /// No description provided for @breastRight.
  ///
  /// In tr, this message translates to:
  /// **'Sağ'**
  String get breastRight;

  /// No description provided for @bottle.
  ///
  /// In tr, this message translates to:
  /// **'Biberon'**
  String get bottle;

  /// No description provided for @solid.
  ///
  /// In tr, this message translates to:
  /// **'Ek gıda'**
  String get solid;

  /// No description provided for @tapToStop.
  ///
  /// In tr, this message translates to:
  /// **'Bitirmek için aynı tarafa tekrar dokunun'**
  String get tapToStop;

  /// No description provided for @bottleAmount.
  ///
  /// In tr, this message translates to:
  /// **'Biberon miktarı'**
  String get bottleAmount;

  /// No description provided for @ml.
  ///
  /// In tr, this message translates to:
  /// **'ml'**
  String get ml;

  /// No description provided for @todaySummary.
  ///
  /// In tr, this message translates to:
  /// **'Bugün'**
  String get todaySummary;

  /// No description provided for @feedCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} beslenme'**
  String feedCount(int count);

  /// No description provided for @breastMinutes.
  ///
  /// In tr, this message translates to:
  /// **'Emzirme {minutes} dk'**
  String breastMinutes(int minutes);

  /// No description provided for @bottleTotal.
  ///
  /// In tr, this message translates to:
  /// **'Biberon {ml} ml'**
  String bottleTotal(int ml);

  /// No description provided for @diaperWet.
  ///
  /// In tr, this message translates to:
  /// **'Islak'**
  String get diaperWet;

  /// No description provided for @diaperDirty.
  ///
  /// In tr, this message translates to:
  /// **'Kirli'**
  String get diaperDirty;

  /// No description provided for @diaperBoth.
  ///
  /// In tr, this message translates to:
  /// **'İkisi de'**
  String get diaperBoth;

  /// No description provided for @diaperCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} bez'**
  String diaperCount(int count);

  /// No description provided for @sleepStart.
  ///
  /// In tr, this message translates to:
  /// **'Uyudu'**
  String get sleepStart;

  /// No description provided for @sleepStop.
  ///
  /// In tr, this message translates to:
  /// **'Uyandı'**
  String get sleepStop;

  /// No description provided for @sleepRunning.
  ///
  /// In tr, this message translates to:
  /// **'Uyuyor'**
  String get sleepRunning;

  /// No description provided for @sleepTotal.
  ///
  /// In tr, this message translates to:
  /// **'Bugün toplam {duration}'**
  String sleepTotal(String duration);

  /// No description provided for @growthAdd.
  ///
  /// In tr, this message translates to:
  /// **'Ölçüm ekle'**
  String get growthAdd;

  /// No description provided for @growthWeight.
  ///
  /// In tr, this message translates to:
  /// **'Ağırlık (kg)'**
  String get growthWeight;

  /// No description provided for @growthLength.
  ///
  /// In tr, this message translates to:
  /// **'Boy (cm)'**
  String get growthLength;

  /// No description provided for @growthHead.
  ///
  /// In tr, this message translates to:
  /// **'Baş çevresi (cm)'**
  String get growthHead;

  /// No description provided for @growthHeadShort.
  ///
  /// In tr, this message translates to:
  /// **'Baş'**
  String get growthHeadShort;

  /// No description provided for @growthEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Henüz ölçüm yok. Doktor kontrollerinde ölçülen değerleri ekleyin.'**
  String get growthEmpty;

  /// No description provided for @whoMedian.
  ///
  /// In tr, this message translates to:
  /// **'DSÖ ortalaması'**
  String get whoMedian;

  /// No description provided for @babyWeightLabel.
  ///
  /// In tr, this message translates to:
  /// **'Bebeğin kilosu'**
  String get babyWeightLabel;

  /// No description provided for @monthAxis.
  ///
  /// In tr, this message translates to:
  /// **'{month}. ay'**
  String monthAxis(int month);

  /// No description provided for @otherTools.
  ///
  /// In tr, this message translates to:
  /// **'Diğer araçlar'**
  String get otherTools;

  /// No description provided for @noRecords.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıt yok.'**
  String get noRecords;

  /// No description provided for @dailyMsgSetting.
  ///
  /// In tr, this message translates to:
  /// **'Günaydın mesajları'**
  String get dailyMsgSetting;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'az',
    'de',
    'en',
    'es',
    'fa',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'tr',
    'uk',
    'ur',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return LAr();
    case 'az':
      return LAz();
    case 'de':
      return LDe();
    case 'en':
      return LEn();
    case 'es':
      return LEs();
    case 'fa':
      return LFa();
    case 'fr':
      return LFr();
    case 'hi':
      return LHi();
    case 'id':
      return LId();
    case 'it':
      return LIt();
    case 'ja':
      return LJa();
    case 'ko':
      return LKo();
    case 'nl':
      return LNl();
    case 'pl':
      return LPl();
    case 'pt':
      return LPt();
    case 'ru':
      return LRu();
    case 'tr':
      return LTr();
    case 'uk':
      return LUk();
    case 'ur':
      return LUr();
    case 'zh':
      return LZh();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
