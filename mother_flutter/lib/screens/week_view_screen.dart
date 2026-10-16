import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../ui/theme.dart';

/// Haftadan haftaya anne ve bebek görünümü (1–40). Kaydırarak gezilir.
///
/// Görseller `assets/3d/wNN.webp` (örn. w04.webp, w40.webp) olarak eklenir;
/// bir hafta için 3D görsel yoksa o haftanın eski fotoğrafı gösterilir.
class WeekViewScreen extends StatefulWidget {
  const WeekViewScreen({super.key, required this.initialWeek});
  final int initialWeek;

  @override
  State<WeekViewScreen> createState() => _WeekViewScreenState();
}

class _WeekViewScreenState extends State<WeekViewScreen> {
  static Set<String>? _assets;

  late final PageController _pages = PageController(initialPage: widget.initialWeek.clamp(1, 40) - 1);
  late int _week = widget.initialWeek.clamp(1, 40);

  @override
  void initState() {
    super.initState();
    if (_assets == null) {
      AssetManifest.loadFromAssetBundle(rootBundle).then((m) {
        _assets = m.listAssets().where((a) => a.startsWith('assets/3d/')).toSet();
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  static String _image(int week) {
    final path = 'assets/3d/w${week.toString().padLeft(2, '0')}.webp';
    return (_assets?.contains(path) ?? false) ? path : AppContent.weekImage(week);
  }

  void _go(int delta) =>
      _pages.animateToPage(_week - 1 + delta, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.weekN(_week))),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pages,
              itemCount: 40,
              onPageChanged: (i) => setState(() => _week = i + 1),
              itemBuilder: (context, i) => _WeekPage(week: i + 1, image: _image(i + 1)),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _week > 1 ? () => _go(-1) : null,
                    icon: const Icon(Icons.chevron_left),
                    iconSize: 32,
                  ),
                  Expanded(
                    child: Slider(
                      value: _week.toDouble(),
                      min: 1,
                      max: 40,
                      divisions: 39,
                      label: '$_week',
                      onChanged: (v) => _pages.jumpToPage(v.round() - 1),
                    ),
                  ),
                  IconButton(
                    onPressed: _week < 40 ? () => _go(1) : null,
                    icon: const Icon(Icons.chevron_right),
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekPage extends StatelessWidget {
  const _WeekPage({required this.week, required this.image});
  final int week;
  final String image;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final size = AppContent.current.babySize(week);
    final trimester = week <= 13 ? 1 : (week <= 27 ? 2 : 3);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: InteractiveViewer(
              maxScale: 4,
              child: Image.asset(image, fit: BoxFit.cover, cacheWidth: 1200),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l.weekN(week),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.ink),
        ),
        const SizedBox(height: 4),
        Text(
          l.trimester(trimester),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.pink),
        ),
        if (size != null) ...[
          const SizedBox(height: 8),
          Text(size, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
        ],
      ],
    );
  }
}
