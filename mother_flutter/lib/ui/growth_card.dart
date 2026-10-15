import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/db.dart';
import '../data/profile.dart';
import '../l10n/app_localizations.dart';
import '../screens/weight_screen.dart';
import 'theme.dart';
import 'widgets.dart';

/// Haftaya göre ortalama tahmini bebek ağırlığı (gram). Genel referans
/// değerlerdir; her bebek farklı gelişir.
const babyWeightByWeek = <int, int>{
  8: 1, 9: 2, 10: 4, 11: 7, 12: 14, 13: 23, 14: 43, 15: 70, 16: 100, 17: 140,
  18: 190, 19: 240, 20: 300, 21: 360, 22: 430, 23: 501, 24: 600, 25: 660,
  26: 760, 27: 875, 28: 1005, 29: 1153, 30: 1319, 31: 1502, 32: 1702,
  33: 1918, 34: 2146, 35: 2383, 36: 2622, 37: 2859, 38: 3083, 39: 3288, 40: 3462,
};

/// Ana sayfadaki anne / bebek kilo grafiği.
class GrowthCard extends StatefulWidget {
  const GrowthCard({super.key, required this.preg, required this.weights, required this.onOpenWeights});
  final Pregnancy preg;
  final List<WeightEntry> weights;
  final VoidCallback onOpenWeights;

  @override
  State<GrowthCard> createState() => _GrowthCardState();
}

class _GrowthCardState extends State<GrowthCard> {
  bool _baby = true;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SegmentedButton<bool>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(value: true, label: Text(l.chartBaby), icon: const Icon(Icons.child_care)),
                ButtonSegment(value: false, label: Text(l.chartMother), icon: const Icon(Icons.pregnant_woman)),
              ],
              selected: {_baby},
              onSelectionChanged: (s) => setState(() => _baby = s.first),
            ),
            const SizedBox(height: 12),
            if (_baby) ..._babyChart(l) else ..._motherChart(l),
          ],
        ),
      ),
    );
  }

  List<Widget> _babyChart(L l) {
    final week = widget.preg.week.clamp(8, 40);
    final grams = babyWeightByWeek[week]!;
    final value = grams >= 1000 ? '${formatNumber(grams / 1000, decimals: 2)} ${l.kg}' : '$grams ${l.gram}';
    return [
      Text(
        widget.preg.week < 8 ? l.babyWeightTooEarly : l.babyWeightNow(value),
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 10),
      SizedBox(height: 150, child: _BabyChart(currentWeek: widget.preg.week)),
      const SizedBox(height: 6),
      Text(l.babyWeightNote, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
    ];
  }

  List<Widget> _motherChart(L l) {
    final w = widget.weights;
    if (w.isEmpty) {
      return [
        Text(l.weightEmpty, style: TextStyle(color: Colors.grey.shade700)),
        const SizedBox(height: 8),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: FilledButton.tonalIcon(
            onPressed: widget.onOpenWeights,
            icon: const Icon(Icons.add),
            label: Text(l.weightAdd),
          ),
        ),
      ];
    }
    final total = w.last.kg - w.first.kg;
    return [
      Text(
        '${formatNumber(w.last.kg)} ${l.kg}'
        '${w.length >= 2 ? ' · ${l.totalChange('${total > 0 ? '+' : ''}${formatNumber(total)}')}' : ''}',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 10),
      InkWell(
        onTap: widget.onOpenWeights,
        child: SizedBox(height: 150, child: WeightChart(entries: w, compact: true)),
      ),
    ];
  }
}

class _BabyChart extends StatelessWidget {
  const _BabyChart({required this.currentWeek});
  final int currentWeek;

  @override
  Widget build(BuildContext context) {
    final all = [for (final e in babyWeightByWeek.entries) FlSpot(e.key.toDouble(), e.value / 1000)];
    final done = all.where((s) => s.x <= currentWeek).toList();
    return LineChart(
      LineChartData(
        minX: 8,
        maxX: 40,
        minY: 0,
        maxY: 4,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (_) => FlLine(color: Colors.grey.shade200, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        lineTouchData: const LineTouchData(enabled: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 28,
              getTitlesWidget: (v, meta) => SideTitleWidget(
                meta: meta,
                child: Text('${v.toInt()}', style: const TextStyle(fontSize: 11)),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 8,
              reservedSize: 24,
              getTitlesWidget: (v, meta) => SideTitleWidget(
                meta: meta,
                child: Text(L.of(context).weekAxis(v.toInt()), style: const TextStyle(fontSize: 11)),
              ),
            ),
          ),
        ),
        lineBarsData: [
          // Tüm eğri (soluk)
          LineChartBarData(
            spots: all,
            isCurved: true,
            color: AppColors.babyBlue.withValues(alpha: 0.45),
            barWidth: 2,
            dashArray: [4, 4],
            dotData: const FlDotData(show: false),
          ),
          // Bugüne kadar (koyu) ve şimdiki hafta noktası
          if (done.isNotEmpty)
            LineChartBarData(
              spots: done,
              isCurved: true,
              color: const Color(0xFF5E98B0),
              barWidth: 3,
              belowBarData: BarAreaData(show: true, color: AppColors.babyBlue.withValues(alpha: 0.18)),
              dotData: FlDotData(
                show: true,
                checkToShowDot: (s, _) => s == done.last,
                getDotPainter: (_, _, _, _) => FlDotCirclePainter(
                  radius: 5,
                  color: AppColors.pink,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
