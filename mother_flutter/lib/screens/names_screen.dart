import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../data/profile.dart';
import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../services/ads.dart';
import '../ui/theme.dart';

/// Rastgele isim önerisi: çarka dokunun ya da telefonu sallayın.
class NamesScreen extends StatefulWidget {
  const NamesScreen({super.key});

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> with SingleTickerProviderStateMixin {
  late final _spin = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200));
  late final _curve = CurvedAnimation(parent: _spin, curve: Curves.easeOutCubic);
  double _turns = 0;
  double _from = 0;
  bool _girl = true;
  bool _busy = false;
  String? _name;
  String? _meaning;
  String? _error;
  StreamSubscription<UserAccelerometerEvent>? _shake;
  DateTime _lastShake = DateTime(2000);

  @override
  void initState() {
    super.initState();
    Profile.load().then((p) {
      if (p?.sex == 'boy' && mounted) setState(() => _girl = false);
    });
    _shake = userAccelerometerEventStream().listen((e) {
      final g = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      if (g > 14 && DateTime.now().difference(_lastShake) > const Duration(seconds: 3)) {
        _lastShake = DateTime.now();
        _roll();
      }
    }, onError: (_) {});
  }

  @override
  void dispose() {
    _shake?.cancel();
    _spin.dispose();
    super.dispose();
  }

  Future<void> _roll() async {
    if (_busy) return;
    HapticFeedback.heavyImpact();
    setState(() {
      _busy = true;
      _name = null;
      _meaning = null;
      _error = null;
      _from = _turns;
      _turns += 3 + Random().nextDouble() * 3;
    });
    await _spin.forward(from: 0);
    try {
      final pick = AppContent.current.randomName(girl: _girl);
      if (!mounted) return;
      if (pick == null) throw StateError('empty');
      final (n, m) = pick;
      HapticFeedback.mediumImpact();
      setState(() {
        _name = n;
        _meaning = m;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = L.of(context).nameError);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final color = _girl ? AppColors.pink : const Color(0xFF5E98B0);
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.namesTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: true, label: Text(l.sexGirl), icon: const Icon(Icons.female)),
                  ButtonSegment(value: false, label: Text(l.sexBoy), icon: const Icon(Icons.male)),
                ],
                selected: {_girl},
                onSelectionChanged: _busy
                    ? null
                    : (s) => setState(() {
                          _girl = s.first;
                          _name = null;
                          _meaning = null;
                          _error = null;
                        }),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _roll,
                child: AnimatedBuilder(
                  animation: _curve,
                  builder: (_, child) => Transform.rotate(
                    angle: (_from + (_turns - _from) * _curve.value) * 2 * pi,
                    child: child,
                  ),
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(colors: [
                        color,
                        AppColors.peach,
                        AppColors.babyBlue,
                        color.withValues(alpha: 0.6),
                        color,
                      ]),
                    ),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: Icon(Icons.child_care, size: 64, color: color),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 120,
                child: _name != null
                    ? Column(
                        children: [
                          Text(_name!, style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: color)),
                          const SizedBox(height: 8),
                          Text(_meaning ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
                        ],
                      )
                    : Text(
                        _error ?? (_busy ? l.spinning : l.namesHint),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                      ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
