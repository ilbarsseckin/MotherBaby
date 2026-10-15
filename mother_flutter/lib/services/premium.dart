import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// "Reklamları kaldır" tek seferlik uygulama içi satın alımı.
/// Ürün kodu Play Console ve App Store Connect'te aynı olmalı: [productId].
class Premium {
  Premium._();

  static const productId = 'remove_ads';
  static const _prefKey = 'premium';

  /// true ise hiçbir reklam yüklenmez/gösterilmez.
  static final isPremium = ValueNotifier<bool>(false);

  /// Mağazadan gelen ürün bilgisi (fiyat dahil); mağaza yoksa null.
  static final product = ValueNotifier<ProductDetails?>(null);

  /// Kullanıcıya gösterilecek son olay: 'thanks', 'error' veya null.
  static final event = ValueNotifier<String?>(null);

  static StreamSubscription<List<PurchaseDetails>>? _sub;

  /// Önce kayıtlı durum okunur (reklam kararı beklemeden verilsin),
  /// ardından mağaza dinlenir ve sessizce geri yükleme yapılır.
  static Future<void> loadCached() async {
    final p = await SharedPreferences.getInstance();
    isPremium.value = p.getBool(_prefKey) ?? false;
  }

  static Future<void> init() async {
    final iap = InAppPurchase.instance;
    if (!await iap.isAvailable()) return;
    _sub ??= iap.purchaseStream.listen(_onPurchases, onError: (_) => event.value = 'error');
    final res = await iap.queryProductDetails({productId});
    if (res.productDetails.isNotEmpty) product.value = res.productDetails.first;
    // Başka cihazda / yeniden kurulumda alınmış satın alımı bulur.
    await iap.restorePurchases();
  }

  static Future<bool> buy() async {
    final p = product.value;
    if (p == null) {
      event.value = 'error';
      return false;
    }
    return InAppPurchase.instance.buyNonConsumable(purchaseParam: PurchaseParam(productDetails: p));
  }

  static Future<void> restore() => InAppPurchase.instance.restorePurchases();

  static Future<void> _onPurchases(List<PurchaseDetails> list) async {
    for (final pd in list) {
      if (pd.productID != productId) continue;
      switch (pd.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          final wasPremium = isPremium.value;
          await _setPremium(true);
          if (!wasPremium && pd.status == PurchaseStatus.purchased) event.value = 'thanks';
        case PurchaseStatus.error:
          event.value = 'error';
        case PurchaseStatus.pending:
        case PurchaseStatus.canceled:
          break;
      }
      // Android'de onaylanmayan satın alım 3 gün içinde iade edilir.
      if (pd.pendingCompletePurchase) await InAppPurchase.instance.completePurchase(pd);
    }
  }

  static Future<void> _setPremium(bool v) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_prefKey, v);
    isPremium.value = v;
  }
}
