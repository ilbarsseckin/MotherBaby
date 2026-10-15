import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Reklam birimi kimlikleri. Debug derlemede her zaman Google test reklamları.
/// Gerçek kimlik boş ('') ise release derlemede o reklam hiç istenmez.
class AdIds {
  static const _pub = 'ca-app-pub-3096856257561140';

  // AdMob → "Bebeğim" uygulamaları oluşturulunca doldurulacak
  static const _androidBanner = '';
  static const _androidInterstitial = '';
  static const _iosBanner = '';
  static const _iosInterstitial = '';

  static String? get banner => _pick(
        android: _androidBanner,
        ios: _iosBanner,
        testAndroid: 'ca-app-pub-3940256099942544/6300978111',
        testIos: 'ca-app-pub-3940256099942544/2934735716',
      );

  static String? get interstitial => _pick(
        android: _androidInterstitial,
        ios: _iosInterstitial,
        testAndroid: 'ca-app-pub-3940256099942544/1033173712',
        testIos: 'ca-app-pub-3940256099942544/4411468910',
      );

  static String? _pick({
    required String android,
    required String ios,
    required String testAndroid,
    required String testIos,
  }) {
    if (kDebugMode) return Platform.isIOS ? testIos : testAndroid;
    final id = Platform.isIOS ? ios : android;
    return id.isEmpty ? null : '$_pub/$id';
  }
}

/// Reklam başlatma: önce kullanıcı onayı (Avrupa için GDPR / UMP),
/// sonra Mobile Ads SDK. Hiçbir reklam [ready] true olmadan yüklenmez.
class Ads {
  Ads._();

  static final ready = ValueNotifier<bool>(false);

  /// Ayarlar ekranında "Gizlilik seçenekleri" gösterilsin mi.
  static final privacyOptionsRequired = ValueNotifier<bool>(false);

  static bool _initStarted = false;

  /// runApp'ten sonra çağrılır (onay formu bir ekran ister).
  static void start() {
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(),
      () async {
        await ConsentForm.loadAndShowConsentFormIfRequired((error) async {
          if (error != null) debugPrint('Onay formu: ${error.message}');
          await _afterConsent();
        });
      },
      (error) async {
        debugPrint('Onay bilgisi alınamadı: ${error.message}');
        await _afterConsent();
      },
    );
    // Önceki açılışta onay alınmışsa beklemeden başlat
    _afterConsent();
  }

  static Future<void> _afterConsent() async {
    final status = await ConsentInformation.instance.getPrivacyOptionsRequirementStatus();
    privacyOptionsRequired.value = status == PrivacyOptionsRequirementStatus.required;

    if (!await ConsentInformation.instance.canRequestAds()) return;
    if (_initStarted) return;
    _initStarted = true;

    // iOS: kişiselleştirilmiş reklam için Apple'ın takip izni penceresi.
    if (Platform.isIOS) {
      try {
        final st = await AppTrackingTransparency.trackingAuthorizationStatus;
        if (st == TrackingStatus.notDetermined) {
          await Future<void>.delayed(const Duration(milliseconds: 500));
          await AppTrackingTransparency.requestTrackingAuthorization();
        }
      } catch (e) {
        debugPrint('ATT: $e');
      }
    }

    await MobileAds.instance.initialize();
    ready.value = true;
    Interstitials.instance.load();
  }

  static Future<void> showPrivacyOptions() async {
    await ConsentForm.showPrivacyOptionsForm((error) {
      if (error != null) debugPrint('Gizlilik formu: ${error.message}');
    });
  }
}

/// Araç ekranlarından ana ekrana dönüşte, sık olmamak kaydıyla tam ekran reklam.
class Interstitials {
  Interstitials._();
  static final instance = Interstitials._();

  /// Kaç dönüşte bir gösterilsin ve iki reklam arasında en az ne kadar geçsin.
  static const _everyNth = 3;
  static const _minGap = Duration(minutes: 2);

  InterstitialAd? _ad;
  bool _loading = false;
  int _returns = 0;
  DateTime _lastShown = DateTime.fromMillisecondsSinceEpoch(0);

  void load() {
    final id = AdIds.interstitial;
    if (id == null || !Ads.ready.value || _loading || _ad != null) return;
    _loading = true;
    InterstitialAd.load(
      adUnitId: id,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _ad = ad;
          _loading = false;
        },
        onAdFailedToLoad: (e) {
          _loading = false;
          debugPrint('Geçiş reklamı yüklenemedi: ${e.message}');
        },
      ),
    );
  }

  /// Bir araç ekranından çıkıldığında çağrılır.
  void onToolClosed() {
    _returns++;
    final ad = _ad;
    if (ad == null) {
      load();
      return;
    }
    if (_returns < _everyNth || DateTime.now().difference(_lastShown) < _minGap) return;
    _returns = 0;
    _lastShown = DateTime.now();
    _ad = null;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (a) {
        a.dispose();
        load();
      },
      onAdFailedToShowFullScreenContent: (a, _) {
        a.dispose();
        load();
      },
    );
    ad.show();
  }
}

/// Ekran genişliğine uyan (anchored adaptive) banner reklam.
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _ad;
  bool _loaded = false;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    Ads.ready.addListener(_tryLoad);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tryLoad();
  }

  void _tryLoad() {
    if (_started || !mounted || !Ads.ready.value) return;
    _started = true;
    _load();
  }

  Future<void> _load() async {
    final id = AdIds.banner;
    if (id == null) return;
    final width = MediaQuery.sizeOf(context).width.truncate();
    final size = await AdSize.getLargeAnchoredAdaptiveBannerAdSize(width);
    if (size == null || !mounted) return;
    final ad = BannerAd(
      adUnitId: id,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, _) => ad.dispose(),
      ),
    );
    _ad = ad;
    await ad.load();
  }

  @override
  void dispose() {
    Ads.ready.removeListener(_tryLoad);
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ad = _ad;
    if (!_loaded || ad == null) return const SizedBox.shrink();
    return SafeArea(
      top: false,
      child: SizedBox(
        width: double.infinity,
        height: ad.size.height.toDouble(),
        child: Center(
          child: SizedBox(
            width: ad.size.width.toDouble(),
            height: ad.size.height.toDouble(),
            child: AdWidget(ad: ad),
          ),
        ),
      ),
    );
  }
}
