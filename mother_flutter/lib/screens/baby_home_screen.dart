import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/baby_db.dart';
import '../data/content.dart';
import '../data/profile.dart';
import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';
import 'album_screen.dart';
import 'baby_trackers.dart';
import 'medicine_screen.dart';
import 'profile_screen.dart';

/// Doğum sonrası ana ekran.
class BabyHomeScreen extends StatefulWidget {
  const BabyHomeScreen({super.key, required this.profile, required this.onChanged});
  final Profile profile;
  final Future<void> Function() onChanged;

  @override
  State<BabyHomeScreen> createState() => _BabyHomeScreenState();
}

class _BabyHomeScreenState extends State<BabyHomeScreen> {
  List<Feeding> _feedings = [];
  List<Diaper> _diapers = [];
  List<Sleep> _sleeps = [];
  List<Growth> _growth = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final f = await BabyRepo.feedings(limit: 50);
    final d = await BabyRepo.diapers(limit: 50);
    final s = await BabyRepo.sleeps(limit: 50);
    final g = await BabyRepo.growth();
    if (!mounted) return;
    setState(() {
      _feedings = f;
      _diapers = d;
      _sleeps = s;
      _growth = g;
    });
  }

  Future<void> _open(Widget screen, {bool ad = true}) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
    await _load();
    if (ad) Interstitials.instance.onToolClosed();
  }

  bool _isToday(DateTime d) {
    final n = DateTime.now();
    return d.year == n.year && d.month == n.month && d.day == n.day;
  }

  void _showMonth(int month) {
    final l = L.of(context);
    final items = AppContent.current.monthInfo(month);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.92,
        builder: (_, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          children: [
            Text(month == 0 ? l.newbornTitle : l.monthTitle(month),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            for (final item in items) _Bullet(item),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final p = widget.profile;
    final (months, days) = p.age;
    final monthItems = AppContent.current.monthInfo(months);
    final lastFeed = _feedings.isEmpty ? null : _feedings.first.start;
    final diapersToday = _diapers.where((d) => _isToday(d.time)).length;
    final sleepToday = _sleeps.where((s) => _isToday(s.start)).fold<int>(0, (a, s) => a + s.seconds);

    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(
        title: Text('${p.babyName} · ${l.kin(p.kin)}'),
        actions: [
          IconButton(
            tooltip: l.settings,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
              await widget.onChanged();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
          children: [
            // Yaş kartı
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: p.sex == 'boy' ? AppColors.babyBlue.withValues(alpha: 0.3) : AppColors.blush,
                      ),
                      child: Icon(Icons.child_care, size: 40, color: p.sex == 'boy' ? const Color(0xFF5E98B0) : AppColors.pink),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.babyAge(months, days),
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.ink)),
                          const SizedBox(height: 4),
                          Text('${l.birthDateLabel}: ${dateFmt.format(p.birthDate!)}',
                              style: TextStyle(color: Colors.grey.shade700)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Günün özeti
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  children: [
                    _Stat(lastFeed == null ? '—' : agoText(l, lastFeed), l.lastFeeding),
                    _Stat('$diapersToday', l.diapersToday),
                    _Stat(durationText(l, sleepToday), l.sleepToday),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.85,
              children: [
                _QuickTool(Icons.baby_changing_station, l.toolFeeding, () => _open(const FeedingScreen())),
                _QuickTool(Icons.child_friendly, l.toolDiaper, () => _open(const DiaperScreen())),
                _QuickTool(Icons.bedtime_outlined, l.toolSleep, () => _open(const SleepScreen())),
                _QuickTool(Icons.straighten, l.toolGrowth, () => _open(GrowthScreen(sex: p.sex, birthDate: p.birthDate!))),
              ],
            ),
            const SizedBox(height: 16),
            // Aylık gelişim
            if (monthItems.isNotEmpty)
              Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => _showMonth(months),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(months == 0 ? l.newbornTitle : l.monthTitle(months),
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 12),
                        for (final item in monthItems.take(3)) _Bullet(item),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(onPressed: () => _showMonth(months), child: Text(l.showMore)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            // Büyüme grafiği
            Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => _open(GrowthScreen(sex: p.sex, birthDate: p.birthDate!)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.babyWeightLabel, style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 160,
                        child: BabyGrowthChart(growth: _growth, sex: p.sex, birthDate: p.birthDate!, compact: true),
                      ),
                      const SizedBox(height: 4),
                      Row(children: [
                        Container(width: 14, height: 3, color: AppColors.pink),
                        const SizedBox(width: 6),
                        Text(p.babyName, style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 16),
                        Container(width: 14, height: 3, color: AppColors.babyBlue),
                        const SizedBox(width: 6),
                        Text(l.whoMedian, style: const TextStyle(fontSize: 12)),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, bottom: 10),
              child: Text(l.otherTools, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            ),
            Row(children: [
              Expanded(child: _QuickTool(Icons.medication_outlined, l.toolMedicine, () => _open(const MedicineScreen()))),
              const SizedBox(width: 8),
              Expanded(child: _QuickTool(Icons.photo_library_outlined, l.toolAlbum, () => _open(const AlbumScreen()))),
            ]),
          ],
        ),
      ),
    );
  }
}

/// "2 sa 10 dk önce" gibi.
String agoText(L l, DateTime t) {
  final d = DateTime.now().difference(t);
  if (d.inMinutes < 60) return l.agoM(d.inMinutes.clamp(0, 59));
  return l.agoHM(d.inHours, d.inMinutes % 60);
}

String durationText(L l, int seconds) {
  final h = seconds ~/ 3600;
  final m = (seconds % 3600) ~/ 60;
  return l.durationHM(h, m);
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(top: 7, end: 10),
            child: Icon(Icons.favorite, size: 10, color: AppColors.pink),
          ),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15, height: 1.45))),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(this.value, this.label);
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.pink)),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _QuickTool extends StatelessWidget {
  const _QuickTool(this.icon, this.label, this.onTap);
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: AppColors.blush, shape: BoxShape.circle),
                child: Icon(icon, color: AppColors.pink, size: 24),
              ),
              const SizedBox(height: 6),
              Text(label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.ink)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bebeğin ağırlığı (ay) ve DSÖ ortanca eğrisi.
class BabyGrowthChart extends StatelessWidget {
  const BabyGrowthChart({super.key, required this.growth, required this.sex, required this.birthDate, this.compact = false});
  final List<Growth> growth;
  final String sex;
  final DateTime birthDate;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final who = sex == 'boy'
        ? whoWeightBoys
        : sex == 'girl'
            ? whoWeightGirls
            : [for (var i = 0; i < 13; i++) (whoWeightBoys[i] + whoWeightGirls[i]) / 2];
    final mine = [
      for (final g in growth)
        if (g.kg != null) FlSpot((g.date.difference(birthDate).inDays / 30.44).clamp(0, 12), g.kg!),
    ];
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 12,
        minY: 2,
        maxY: 12,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 2,
          getDrawingHorizontalLine: (_) => FlLine(color: Colors.grey.shade200, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(enabled: !compact),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
              reservedSize: 28,
              getTitlesWidget: (v, meta) =>
                  SideTitleWidget(meta: meta, child: Text('${v.toInt()}', style: const TextStyle(fontSize: 11))),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 3,
              reservedSize: 24,
              getTitlesWidget: (v, meta) => SideTitleWidget(
                meta: meta,
                child: Text(L.of(context).monthAxis(v.toInt()), style: const TextStyle(fontSize: 11)),
              ),
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [for (var i = 0; i < who.length; i++) FlSpot(i.toDouble(), who[i])],
            isCurved: true,
            color: AppColors.babyBlue,
            barWidth: 2,
            dashArray: [4, 4],
            dotData: const FlDotData(show: false),
          ),
          if (mine.isNotEmpty)
            LineChartBarData(
              spots: mine,
              isCurved: mine.length > 2,
              preventCurveOverShooting: true,
              color: AppColors.pink,
              barWidth: 3,
              dotData: const FlDotData(show: true),
            ),
        ],
      ),
    );
  }
}
