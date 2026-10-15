import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/db.dart';
import '../data/profile.dart';
import '../l10n/app_localizations.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  List<WeightEntry> _entries = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final e = await WeightRepo.all();
    setState(() {
      _entries = e;
      _loading = false;
    });
  }

  Future<void> _add() async {
    final l = L.of(context);
    final ctrl = TextEditingController();
    final first = _entries.isEmpty;
    final kg = await showDialog<double>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(first ? l.weightStart : l.weightToday),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
          decoration: InputDecoration(suffixText: l.kg, hintText: l.weightHint),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(88, 40)),
            onPressed: () {
              final v = parseNumber(ctrl.text);
              if (v == null || v < 30 || v > 250) return;
              Navigator.pop(c, v);
            },
            child: Text(l.save),
          ),
        ],
      ),
    );
    if (kg == null) return;
    final profile = await Profile.load();
    final week = profile?.pregnancy.week ?? 0;
    await WeightRepo.upsert(DateTime.now(), week, kg);
    await _load();
    if (mounted) showSnack(context, l.saved);
  }

  Future<void> _clear() async {
    final l = L.of(context);
    if (!await confirm(context, l.weightClearTitle, l.weightClearMessage)) return;
    await WeightRepo.clear();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final newestFirst = _entries.reversed.toList();
    final total = _entries.length >= 2 ? _entries.last.kg - _entries.first.kg : null;
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(
        title: Text(l.toolWeight),
        actions: [
          if (_entries.isNotEmpty)
            IconButton(tooltip: l.deleteAll, icon: const Icon(Icons.delete_sweep_outlined), onPressed: _clear),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _add,
        icon: const Icon(Icons.add),
        label: Text(l.weightAdd),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
              children: [
                if (_entries.isEmpty)
                  EmptyState(icon: Icons.monitor_weight_outlined, text: l.weightEmpty)
                else ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 16, 16, 8),
                      child: Column(
                        children: [
                          if (total != null)
                            Text(
                              l.totalChange(_signed(total)),
                              style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.pink),
                            ),
                          const SizedBox(height: 12),
                          SizedBox(height: 200, child: WeightChart(entries: _entries)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (var i = 0; i < newestFirst.length; i++)
                    _row(newestFirst[i], i + 1 < newestFirst.length ? newestFirst[i + 1] : null),
                ],
              ],
            ),
    );
  }

  Widget _row(WeightEntry e, WeightEntry? prev) {
    final l = L.of(context);
    final diff = prev == null ? 0.0 : e.kg - prev.kg;
    return Dismissible(
      key: ValueKey(e.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red.shade100,
        child: const Icon(Icons.delete_outline),
      ),
      onDismissed: (_) async {
        await WeightRepo.remove(e.id);
        _load();
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.blush,
            child: Text('${e.week}', style: const TextStyle(color: AppColors.pink, fontWeight: FontWeight.w800)),
          ),
          title: Text('${_fmt(e.kg)} ${l.kg}', style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(l.weekAndDate(e.week, dateFmt.format(e.date))),
          trailing: Text(
            prev == null ? '—' : '${_signed(diff)} ${l.kg}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: diff > 0 ? AppColors.pink : (diff < 0 ? Colors.teal : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  static String _fmt(double v) => formatNumber(v);
  static String _signed(double v) => '${v > 0 ? '+' : ''}${_fmt(v)}';
}

/// Haftaya göre kilo grafiği.
class WeightChart extends StatelessWidget {
  const WeightChart({super.key, required this.entries, this.compact = false});
  final List<WeightEntry> entries;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final spots = [for (final e in entries) FlSpot(e.week.toDouble(), e.kg)];
    final ys = entries.map((e) => e.kg);
    final minY = (ys.reduce((a, b) => a < b ? a : b) - 2).floorToDouble();
    final maxY = (ys.reduce((a, b) => a > b ? a : b) + 2).ceilToDouble();
    final maxX = spots.map((s) => s.x).reduce((a, b) => a > b ? a : b);
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: maxX < 40 ? 40 : maxX,
        minY: minY,
        maxY: maxY,
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) => FlLine(color: Colors.grey.shade200, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: !compact,
              reservedSize: 36,
              getTitlesWidget: (v, meta) => SideTitleWidget(
                meta: meta,
                child: Text(v.toInt().toString(), style: const TextStyle(fontSize: 11)),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              reservedSize: 24,
              getTitlesWidget: (v, meta) => SideTitleWidget(
                meta: meta,
                child: Text(L.of(context).weekAxis(v.toInt()), style: const TextStyle(fontSize: 11)),
              ),
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            preventCurveOverShooting: true,
            color: AppColors.pink,
            barWidth: 3,
            dotData: FlDotData(show: !compact),
            belowBarData: BarAreaData(show: true, color: AppColors.pink.withValues(alpha: 0.12)),
          ),
        ],
      ),
    );
  }
}
