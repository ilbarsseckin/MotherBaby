import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/db.dart';
import '../l10n/app_localizations.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';

class ContractionScreen extends StatefulWidget {
  const ContractionScreen({super.key});

  @override
  State<ContractionScreen> createState() => _ContractionScreenState();
}

class _ContractionScreenState extends State<ContractionScreen> {
  List<Contraction> _history = []; // en yeni başta
  DateTime? _start;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final h = await CounterRepo.contractions();
    setState(() => _history = h);
  }

  int get _elapsed => _start == null ? 0 : DateTime.now().difference(_start!).inSeconds;

  Future<void> _toggle() async {
    HapticFeedback.mediumImpact();
    if (_start == null) {
      setState(() => _start = DateTime.now());
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
    } else {
      _ticker?.cancel();
      final start = _start!;
      final secs = _elapsed;
      setState(() => _start = null);
      await CounterRepo.addContraction(start, secs);
      _load();
    }
  }

  /// Son kasılmalar arasındaki ortalama aralık (dakika), son 1 saat.
  String? _summary(L l) {
    final recent = _history
        .where((c) => DateTime.now().difference(c.start) < const Duration(hours: 1))
        .toList();
    if (recent.length < 2) return null;
    var total = 0;
    for (var i = 0; i < recent.length - 1; i++) {
      total += recent[i].start.difference(recent[i + 1].start).inSeconds;
    }
    final avgGap = total / (recent.length - 1);
    final avgLen = recent.map((c) => c.seconds).reduce((a, b) => a + b) / recent.length;
    return l.contractionSummary(recent.length, formatDuration(avgLen.round()), formatNumber(avgGap / 60));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final running = _start != null;
    final summary = _summary(l);
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolContraction)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(running ? l.contractionRunning : l.contractionIdle,
                      style: TextStyle(color: Colors.grey.shade700)),
                  const SizedBox(height: 8),
                  Text(formatDuration(_elapsed),
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w800, color: AppColors.ink,
                          fontFeatures: [FontFeature.tabularFigures()])),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 170,
                    height: 170,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: running ? Colors.redAccent : AppColors.pink,
                      ),
                      onPressed: _toggle,
                      child: Text(running ? l.contractionStopBtn : l.contractionStartBtn,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                    ),
                  ),
                  if (summary != null) ...[
                    const SizedBox(height: 16),
                    Text(summary, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                  const SizedBox(height: 10),
                  Text(
                    l.contractionHelp,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_history.isEmpty)
            EmptyState(icon: Icons.history, text: l.contractionEmpty)
          else ...[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, bottom: 8),
              child: Text(l.history, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ),
            for (var i = 0; i < _history.length; i++)
              Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppColors.blush,
                    child: Icon(Icons.timer_outlined, color: AppColors.pink),
                  ),
                  title: Text(l.contractionDuration(formatDuration(_history[i].seconds))),
                  subtitle: Text([
                    dateTimeFmt.format(_history[i].start),
                    if (i + 1 < _history.length)
                      l.contractionGap(formatDuration(_history[i].start.difference(_history[i + 1].start).inSeconds.clamp(0, 99 * 60 + 59))),
                  ].join(' · ')),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () async {
                      await CounterRepo.removeContraction(_history[i].id);
                      _load();
                    },
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
