import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../l10n/app_localizations.dart';
import '../services/premium.dart';

/// Ayarlar ekranındaki "Reklamları kaldır" kartı.
class PremiumCard extends StatefulWidget {
  const PremiumCard({super.key});

  @override
  State<PremiumCard> createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    Premium.event.addListener(_onEvent);
  }

  @override
  void dispose() {
    Premium.event.removeListener(_onEvent);
    super.dispose();
  }

  void _onEvent() {
    final e = Premium.event.value;
    if (e == null || !mounted) return;
    Premium.event.value = null;
    setState(() => _busy = false);
    final l = L.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e == 'thanks' ? l.premiumThanks : l.premiumUnavailable)),
    );
  }

  Future<void> _buy() async {
    setState(() => _busy = true);
    try {
      await Premium.buy();
    } catch (_) {
      Premium.event.value = 'error';
    }
    // Sonuç satın alma akışından gelir; kullanıcı vazgeçerse düğme geri açılsın.
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _busy = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final scheme = Theme.of(context).colorScheme;
    return ValueListenableBuilder<bool>(
      valueListenable: Premium.isPremium,
      builder: (_, premium, _) => Card(
        margin: const EdgeInsets.only(top: 20),
        color: scheme.primaryContainer.withValues(alpha: 0.5),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: premium
              ? Row(
                  children: [
                    Icon(Icons.workspace_premium, color: scheme.primary),
                    const SizedBox(width: 12),
                    Expanded(child: Text(l.premiumActive, style: Theme.of(context).textTheme.titleSmall)),
                  ],
                )
              : ValueListenableBuilder<ProductDetails?>(
                  valueListenable: Premium.product,
                  builder: (_, product, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.workspace_premium, color: scheme.primary),
                          const SizedBox(width: 12),
                          Expanded(child: Text(l.premiumTitle, style: Theme.of(context).textTheme.titleMedium)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(l.premiumDesc),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: product == null || _busy ? null : _buy,
                        child: Text(product == null ? l.premiumBuyNoPrice : l.premiumBuy(product.price)),
                      ),
                      TextButton(
                        onPressed: Premium.restore,
                        child: Text(l.premiumRestore),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
