import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../ui/theme.dart';

/// Haftadan haftaya bebeğin döndürülebilir 3D modeli (1–40).
///
/// Modeller `assets/3d/models/hafta_NN.glb`; parmakla döndürülür,
/// iki parmakla yakınlaştırılır.
class WeekViewScreen extends StatefulWidget {
  const WeekViewScreen({super.key, required this.initialWeek});
  final int initialWeek;

  @override
  State<WeekViewScreen> createState() => _WeekViewScreenState();
}

class _WeekViewScreenState extends State<WeekViewScreen> {
  /// Ekranda yazan hafta (sürgü sürüklenirken anında değişir).
  late int _week = widget.initialWeek.clamp(1, 40);

  /// 3D görüntüleyicide yüklü hafta; sürgü bırakılınca güncellenir,
  /// böylece sürüklerken her hafta için model yeniden yüklenmez.
  late int _modelWeek = _week;

  void _set(int week) => setState(() => _week = _modelWeek = week.clamp(1, 40));

  static String _model(int week) => 'assets/3d/models/hafta_${week.toString().padLeft(2, '0')}.glb';

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final size = AppContent.current.babySize(_week);
    final trimester = _week <= 13 ? 1 : (_week <= 27 ? 2 : 3);
    return Scaffold(
      appBar: AppBar(title: Text(l.weekN(_week))),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ModelViewer(
                  key: ValueKey(_modelWeek),
                  src: _model(_modelWeek),
                  alt: l.weekN(_modelWeek),
                  backgroundColor: const Color(0xFFFFF4F6),
                  environmentImage: 'neutral',
                  exposure: 1.1,
                  shadowIntensity: 0.8,
                  cameraOrbit: '0deg 75deg auto',
                  cameraControls: true,
                  autoRotate: true,
                  autoRotateDelay: 1500,
                  rotationPerSecond: '20deg',
                  disableZoom: false,
                  interactionPrompt: InteractionPrompt.none,
                  ar: false,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l.weekN(_week),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.ink),
          ),
          Text(
            l.trimester(trimester),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.pink),
          ),
          if (size != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
              child: Text(size, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
            ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _week > 1 ? () => _set(_week - 1) : null,
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
                      onChanged: (v) => setState(() => _week = v.round()),
                      onChangeEnd: (v) => _set(v.round()),
                    ),
                  ),
                  IconButton(
                    onPressed: _week < 40 ? () => _set(_week + 1) : null,
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
