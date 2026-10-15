import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/db.dart';
import '../l10n/app_localizations.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';

class KickScreen extends StatefulWidget {
  const KickScreen({super.key});

  @override
  State<KickScreen> createState() => _KickScreenState();
}

class _KickScreenState extends State<KickScreen> {
  List<KickSession> _history = [];
  DateTime? _start;
  int _count = 0;
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
    final h = await CounterRepo.kicks();
    setState(() => _history = h);
  }

  int get _elapsed => _start == null ? 0 : DateTime.now().difference(_start!).inSeconds;

  void _toggle() async {
    HapticFeedback.mediumImpact();
    if (_start == null) {
      setState(() {
        _start = DateTime.now();
        _count = 0;
      });
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
    } else {
      _ticker?.cancel();
      final start = _start!;
      final secs = _elapsed;
      final count = _count;
      setState(() {
        _start = null;
        _count = 0;
      });
      await CounterRepo.addKick(start, secs, count);
      _load();
    }
  }

  void _kick() {
    if (_start == null) return;
    HapticFeedback.heavyImpact();
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final running = _start != null;
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolKick)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(formatDuration(_elapsed),
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: AppColors.ink,
                          fontFeatures: [FontFeature.tabularFigures()])),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _kick,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: running ? AppColors.pink : Colors.grey.shade300,
                        boxShadow: running
                            ? [BoxShadow(color: AppColors.pink.withValues(alpha: 0.35), blurRadius: 24, spreadRadius: 2)]
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$_count',
                              style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w900, color: Colors.white)),
                          Text(running ? l.kickTap : l.kickIdle,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: _toggle,
                    icon: Icon(running ? Icons.stop : Icons.play_arrow),
                    label: Text(running ? l.stopAndSave : l.start),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l.kickHelp,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_history.isEmpty)
            EmptyState(icon: Icons.history, text: l.kickEmpty)
          else ...[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, bottom: 8),
              child: Text(l.history, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ),
            for (final k in _history)
              Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.blush,
                    child: Text('${k.count}', style: const TextStyle(color: AppColors.pink, fontWeight: FontWeight.w800)),
                  ),
                  title: Text(l.kickRow(k.count, formatDuration(k.seconds))),
                  subtitle: Text(dateTimeFmt.format(k.date)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () async {
                      await CounterRepo.removeKick(k.id);
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
