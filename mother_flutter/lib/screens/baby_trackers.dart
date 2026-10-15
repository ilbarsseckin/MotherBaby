import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/baby_db.dart';
import '../l10n/app_localizations.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';
import 'baby_home_screen.dart';

bool _isToday(DateTime d) {
  final n = DateTime.now();
  return d.year == n.year && d.month == n.month && d.day == n.day;
}

/// Ekrandan çıkılsa da devam eden sayaç (başlangıç zamanı kalıcı saklanır).
class _RunningTimer {
  _RunningTimer(this.key);
  final String key;

  Future<(String, DateTime)?> read() async {
    final p = await SharedPreferences.getInstance();
    final v = p.getString(key);
    if (v == null) return null;
    final i = v.indexOf('|');
    final t = DateTime.tryParse(v.substring(i + 1));
    return t == null ? null : (v.substring(0, i), t);
  }

  Future<void> start(String tag) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(key, '$tag|${DateTime.now().toIso8601String()}');
  }

  Future<void> clear() async {
    final p = await SharedPreferences.getInstance();
    await p.remove(key);
  }
}

Widget _historyTile({
  required Key key,
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onDelete,
}) {
  return Dismissible(
    key: key,
    direction: DismissDirection.endToStart,
    background: Container(
      alignment: AlignmentDirectional.centerEnd,
      padding: const EdgeInsetsDirectional.only(end: 20),
      color: Colors.red.shade100,
      child: const Icon(Icons.delete_outline),
    ),
    onDismissed: (_) => onDelete(),
    child: Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: AppColors.blush, child: Icon(icon, color: AppColors.pink)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    ),
  );
}

// ======================= Beslenme =======================

class FeedingScreen extends StatefulWidget {
  const FeedingScreen({super.key});

  @override
  State<FeedingScreen> createState() => _FeedingScreenState();
}

class _FeedingScreenState extends State<FeedingScreen> {
  final _timer = _RunningTimer('feedRunning');
  List<Feeding> _items = [];
  (String, DateTime)? _running;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _load();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_running != null && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final items = await BabyRepo.feedings();
    final r = await _timer.read();
    if (mounted) {
      setState(() {
        _items = items;
        _running = r;
      });
    }
  }

  Future<void> _breast(String side) async {
    HapticFeedback.mediumImpact();
    final r = _running;
    if (r != null) {
      // Çalışan sayacı bitir ve kaydet
      await BabyRepo.addFeeding(r.$2, r.$1, seconds: DateTime.now().difference(r.$2).inSeconds);
      await _timer.clear();
      if (r.$1 == side) {
        await _load();
        return;
      }
    }
    await _timer.start(side);
    await _load();
  }

  Future<void> _bottle() async {
    final l = L.of(context);
    final ctrl = TextEditingController();
    final ml = await showDialog<int>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(l.bottleAmount),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(suffixText: l.ml),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(88, 40)),
            onPressed: () {
              final v = int.tryParse(ctrl.text);
              if (v != null && v > 0 && v < 1000) Navigator.pop(c, v);
            },
            child: Text(l.save),
          ),
        ],
      ),
    );
    if (ml == null) return;
    await BabyRepo.addFeeding(DateTime.now(), 'bottle', ml: ml);
    await _load();
  }

  Future<void> _solid() async {
    await BabyRepo.addFeeding(DateTime.now(), 'solid');
    if (mounted) showSnack(context, L.of(context).saved);
    await _load();
  }

  String _kindLabel(L l, String k) => switch (k) {
        'left' => l.breastLeft,
        'right' => l.breastRight,
        'bottle' => l.bottle,
        _ => l.solid,
      };

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final today = _items.where((f) => _isToday(f.start)).toList();
    final breastSec = today.where((f) => f.kind == 'left' || f.kind == 'right').fold<int>(0, (a, f) => a + f.seconds);
    final ml = today.fold<int>(0, (a, f) => a + f.ml);
    final r = _running;

    Widget side(String key, String label) {
      final active = r?.$1 == key;
      return Expanded(
        child: SizedBox(
          height: 110,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: active ? AppColors.pink : AppColors.blush,
              foregroundColor: active ? Colors.white : AppColors.ink,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () => _breast(key),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                if (active)
                  Text(formatDuration(DateTime.now().difference(r!.$2).inSeconds),
                      style: const TextStyle(fontSize: 18, fontFeatures: [FontFeature.tabularFigures()])),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolFeeding)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Row(children: [side('left', l.breastLeft), const SizedBox(width: 12), side('right', l.breastRight)]),
          if (r != null) ...[
            const SizedBox(height: 8),
            Text(l.tapToStop, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700)),
          ],
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _bottle,
                icon: const Icon(Icons.local_drink_outlined),
                label: Text(l.bottle),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _solid,
                icon: const Icon(Icons.restaurant_outlined),
                label: Text(l.solid),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              ),
            ),
          ]),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: Text(l.todaySummary, style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Text(
                  '${l.feedCount(today.length)} · ${l.breastMinutes(breastSec ~/ 60)} · ${l.bottleTotal(ml)}'),
            ),
          ),
          const SizedBox(height: 12),
          if (_items.isEmpty)
            EmptyState(icon: Icons.history, text: l.noRecords)
          else
            for (final f in _items)
              _historyTile(
                key: ValueKey('f${f.id}'),
                icon: f.kind == 'bottle'
                    ? Icons.local_drink_outlined
                    : f.kind == 'solid'
                        ? Icons.restaurant_outlined
                        : Icons.baby_changing_station,
                title: [
                  _kindLabel(l, f.kind),
                  if (f.seconds > 0) formatDuration(f.seconds),
                  if (f.ml > 0) '${f.ml} ${l.ml}',
                ].join(' · '),
                subtitle: dateTimeFmt.format(f.start),
                onDelete: () async {
                  await BabyRepo.remove('feedings', f.id);
                  _load();
                },
              ),
        ],
      ),
    );
  }
}

// ======================= Bez =======================

class DiaperScreen extends StatefulWidget {
  const DiaperScreen({super.key});

  @override
  State<DiaperScreen> createState() => _DiaperScreenState();
}

class _DiaperScreenState extends State<DiaperScreen> {
  List<Diaper> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await BabyRepo.diapers();
    if (mounted) setState(() => _items = items);
  }

  Future<void> _add(String kind) async {
    HapticFeedback.mediumImpact();
    await BabyRepo.addDiaper(kind);
    if (mounted) showSnack(context, L.of(context).saved);
    _load();
  }

  String _label(L l, String k) => switch (k) {
        'wet' => l.diaperWet,
        'dirty' => l.diaperDirty,
        _ => l.diaperBoth,
      };

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final today = _items.where((d) => _isToday(d.time)).toList();
    Widget btn(String kind, IconData icon) => Expanded(
          child: SizedBox(
            height: 96,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.blush,
                foregroundColor: AppColors.ink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () => _add(kind),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(icon, color: AppColors.pink, size: 28),
                const SizedBox(height: 6),
                Text(_label(l, kind), textAlign: TextAlign.center),
              ]),
            ),
          ),
        );
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolDiaper)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Row(children: [
            btn('wet', Icons.water_drop_outlined),
            const SizedBox(width: 10),
            btn('dirty', Icons.circle_outlined),
            const SizedBox(width: 10),
            btn('both', Icons.all_inclusive),
          ]),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: Text(l.todaySummary, style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Text([
                l.diaperCount(today.length),
                '${l.diaperWet}: ${today.where((d) => d.kind != 'dirty').length}',
                '${l.diaperDirty}: ${today.where((d) => d.kind != 'wet').length}',
              ].join(' · ')),
            ),
          ),
          const SizedBox(height: 12),
          if (_items.isEmpty)
            EmptyState(icon: Icons.history, text: l.noRecords)
          else
            for (final d in _items)
              _historyTile(
                key: ValueKey('d${d.id}'),
                icon: Icons.child_friendly,
                title: _label(l, d.kind),
                subtitle: dateTimeFmt.format(d.time),
                onDelete: () async {
                  await BabyRepo.remove('diapers', d.id);
                  _load();
                },
              ),
        ],
      ),
    );
  }
}

// ======================= Uyku =======================

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  final _timer = _RunningTimer('sleepRunning');
  List<Sleep> _items = [];
  DateTime? _start;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _load();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_start != null && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final items = await BabyRepo.sleeps();
    final r = await _timer.read();
    if (mounted) {
      setState(() {
        _items = items;
        _start = r?.$2;
      });
    }
  }

  Future<void> _toggle() async {
    HapticFeedback.mediumImpact();
    final s = _start;
    if (s == null) {
      await _timer.start('sleep');
    } else {
      await BabyRepo.addSleep(s, DateTime.now().difference(s).inSeconds);
      await _timer.clear();
    }
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final running = _start != null;
    final todaySec = _items.where((s) => _isToday(s.start)).fold<int>(0, (a, s) => a + s.seconds);
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolSleep)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Text(running ? l.sleepRunning : l.sleepTotal(durationText(l, todaySec)),
                    style: TextStyle(color: Colors.grey.shade700)),
                const SizedBox(height: 8),
                Text(formatDuration(running ? DateTime.now().difference(_start!).inSeconds : 0),
                    style: const TextStyle(
                        fontSize: 44, fontWeight: FontWeight.w800, fontFeatures: [FontFeature.tabularFigures()])),
                const SizedBox(height: 16),
                SizedBox(
                  width: 160,
                  height: 160,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: running ? const Color(0xFF5E98B0) : AppColors.pink,
                    ),
                    onPressed: _toggle,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(running ? Icons.wb_sunny_outlined : Icons.bedtime_outlined, size: 36),
                      const SizedBox(height: 6),
                      Text(running ? l.sleepStop : l.sleepStart,
                          textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800)),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          if (_items.isEmpty)
            EmptyState(icon: Icons.history, text: l.noRecords)
          else
            for (final s in _items)
              _historyTile(
                key: ValueKey('s${s.id}'),
                icon: Icons.bedtime_outlined,
                title: durationText(l, s.seconds),
                subtitle: dateTimeFmt.format(s.start),
                onDelete: () async {
                  await BabyRepo.remove('sleeps', s.id);
                  _load();
                },
              ),
        ],
      ),
    );
  }
}

// ======================= Büyüme =======================

class GrowthScreen extends StatefulWidget {
  const GrowthScreen({super.key, required this.sex, required this.birthDate});
  final String sex;
  final DateTime birthDate;

  @override
  State<GrowthScreen> createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> {
  List<Growth> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await BabyRepo.growth();
    if (mounted) setState(() => _items = items);
  }

  Future<void> _add() async {
    final l = L.of(context);
    final kg = TextEditingController();
    final cm = TextEditingController();
    final head = TextEditingController();
    InputDecoration dec(String label) => InputDecoration(labelText: label);
    final fmt = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
    const kb = TextInputType.numberWithOptions(decimal: true);
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(l.growthAdd),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: kg, autofocus: true, keyboardType: kb, inputFormatters: fmt, decoration: dec(l.growthWeight)),
          const SizedBox(height: 8),
          TextField(controller: cm, keyboardType: kb, inputFormatters: fmt, decoration: dec(l.growthLength)),
          const SizedBox(height: 8),
          TextField(controller: head, keyboardType: kb, inputFormatters: fmt, decoration: dec(l.growthHead)),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: Text(l.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(88, 40)),
            onPressed: () => Navigator.pop(c, true),
            child: Text(l.save),
          ),
        ],
      ),
    );
    if (ok != true) return;
    final w = parseNumber(kg.text), len = parseNumber(cm.text), h = parseNumber(head.text);
    if (w == null && len == null && h == null) return;
    await BabyRepo.addGrowth(DateTime.now(), kg: w, cm: len, head: h);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolGrowth)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _add,
        icon: const Icon(Icons.add),
        label: Text(l.growthAdd),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 16, 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.babyWeightLabel, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: BabyGrowthChart(growth: _items, sex: widget.sex, birthDate: widget.birthDate),
                ),
                Text(l.whoMedian, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          if (_items.isEmpty)
            EmptyState(icon: Icons.straighten, text: l.growthEmpty)
          else
            for (final g in _items.reversed)
              _historyTile(
                key: ValueKey('g${g.id}'),
                icon: Icons.straighten,
                title: [
                  if (g.kg != null) '${formatNumber(g.kg!, decimals: 2)} ${l.kg}',
                  if (g.cm != null) '${formatNumber(g.cm!)} cm',
                  if (g.head != null) '${l.growthHeadShort} ${formatNumber(g.head!)} cm',
                ].join(' · '),
                subtitle: dateFmt.format(g.date),
                onDelete: () async {
                  await BabyRepo.remove('growth', g.id);
                  _load();
                },
              ),
        ],
      ),
    );
  }
}
