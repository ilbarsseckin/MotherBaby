import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/baby_db.dart';
import '../data/content.dart';
import '../data/db.dart';
import '../data/profile.dart';
import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../services/ads.dart';
import '../services/notifications.dart';
import '../ui/growth_card.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';
import 'album_screen.dart';
import 'baby_home_screen.dart';
import 'checklist_screen.dart';
import 'contraction_screen.dart';
import 'kick_screen.dart';
import 'week_view_screen.dart';
import 'medicine_screen.dart';
import 'names_screen.dart';
import 'profile_screen.dart';
import 'weight_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Profile? _profile;
  double _tests = 0, _needs = 0, _bag = 0;
  List<WeightEntry> _weights = [];

  @override
  void initState() {
    super.initState();
    _refresh();
    Notifications.askOnce().then((_) => Notifications.scheduleMilestones());
  }

  Future<void> _refresh() async {
    final p = await Profile.load();
    final t = await ChecklistRepo.progress(ChecklistKind.tests);
    final n = await ChecklistRepo.progress(ChecklistKind.needs);
    final b = await ChecklistRepo.progress(ChecklistKind.bag);
    final w = await WeightRepo.all();
    if (!mounted) return;
    setState(() {
      _profile = p;
      _tests = t;
      _needs = n;
      _bag = b;
      _weights = w;
    });
  }

  Future<void> _open(Widget screen) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
    _refresh();
    if (screen is! ProfileScreen) Interstitials.instance.onToolClosed();
  }

  void _showDaily(String who) {
    final l = L.of(context);
    final preg = _profile!.pregnancy;
    final title = who == 'baby' ? l.dailyBabyTitle(preg.week) : l.dailyMotherTitle(preg.week);
    final items = AppContent.current.dailyInfo(who, preg.daysPassed);
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
            Row(children: [
              Icon(who == 'baby' ? Icons.child_care : Icons.pregnant_woman, color: AppColors.pink),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),
            ]),
            const SizedBox(height: 16),
            if (items.isEmpty)
              EmptyState(icon: Icons.info_outline, text: l.noInfoToday)
            else
              for (final item in items)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.only(top: 7, end: 10),
                        child: Icon(Icons.favorite, size: 10, color: AppColors.pink),
                      ),
                      Expanded(child: Text(item, style: const TextStyle(fontSize: 16, height: 1.5))),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Future<void> _babyBorn() async {
    final l = L.of(context);
    final p = _profile!;
    DateTime date = DateTime.now();
    var sex = p.sex == 'unknown' ? 'girl' : p.sex;
    final kg = TextEditingController();
    final cm = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => StatefulBuilder(
        builder: (c, setD) => AlertDialog(
          title: Text(l.babyBornTitle),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.cake_outlined, color: AppColors.pink),
                title: Text(l.birthDateLabel),
                subtitle: Text(dateFmt.format(date)),
                onTap: () async {
                  final d = await showDatePicker(
                    context: c,
                    initialDate: date,
                    firstDate: DateTime.now().subtract(const Duration(days: 400)),
                    lastDate: DateTime.now(),
                  );
                  if (d != null) setD(() => date = d);
                },
              ),
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(value: 'girl', label: Text(l.sexGirl)),
                  ButtonSegment(value: 'boy', label: Text(l.sexBoy)),
                ],
                selected: {sex},
                onSelectionChanged: (s) => setD(() => sex = s.first),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: kg,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: '${l.birthWeight} (${l.optional})'),
              ),
              TextField(
                controller: cm,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: '${l.birthLength} (${l.optional})'),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(c, false), child: Text(l.cancel)),
            FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size(88, 40)),
              onPressed: () => Navigator.pop(c, true),
              child: Text(l.save),
            ),
          ],
        ),
      ),
    );
    if (ok != true) return;
    await Profile(babyName: p.babyName, sex: sex, kin: p.kin, mode: p.mode, date: p.date, birthDate: date).save();
    final w = parseNumber(kg.text), len = parseNumber(cm.text);
    if (w != null || len != null) await BabyRepo.addGrowth(date, kg: w, cm: len);
    await Notifications.scheduleMilestones();
    await _refresh();
  }

  Future<void> _suggest() async {
    final l = L.of(context);
    final uri = Uri(
      scheme: 'mailto',
      path: 'ilbarsseckin@gmail.com',
      queryParameters: {'subject': l.suggestSubject, 'body': '${l.suggestBody}\n'},
    );
    if (!await launchUrl(uri)) {
      if (mounted) showSnack(context, l.emailError);
    }
  }

  Future<void> _rate() async {
    final review = InAppReview.instance;
    if (await review.isAvailable()) {
      await review.requestReview();
    } else {
      await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.ilbarsseckinapp.bebegim'),
          mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final p = _profile;
    if (p == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    if (p.isBorn) return BabyHomeScreen(key: ValueKey(p.birthDate), profile: p, onChanged: _refresh);
    final preg = p.pregnancy;

    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(
        title: Text('${p.babyName} · ${l.kin(p.kin)}'),
        actions: [
          IconButton(
            tooltip: l.settings,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () async {
              final r = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (_) => const ProfileScreen()));
              await _refresh();
              if (r == 'born') await _babyBorn();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
          children: [
            _WeekCard(preg: preg),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: _PillButton(
                  icon: Icons.child_care,
                  label: l.babyToday,
                  color: AppColors.babyBlue,
                  onTap: () => _showDaily('baby'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _PillButton(
                  icon: Icons.pregnant_woman,
                  label: l.motherToday,
                  color: AppColors.pink,
                  onTap: () => _showDaily('mother'),
                ),
              ),
            ]),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: ProgressRing(value: preg.progress, label: l.ringBirth, size: 64)),
                    Expanded(
                      child: ProgressRing(
                        value: _tests,
                        label: l.ringTests,
                        color: const Color(0xFF6FA8BD),
                        size: 64,
                        onTap: () => _open(const ChecklistScreen(kind: ChecklistKind.tests)),
                      ),
                    ),
                    Expanded(
                      child: ProgressRing(
                        value: _needs,
                        label: l.ringNeeds,
                        color: const Color(0xFFE0A05A),
                        size: 64,
                        onTap: () => _open(const ChecklistScreen(kind: ChecklistKind.needs)),
                      ),
                    ),
                    Expanded(
                      child: ProgressRing(
                        value: _bag,
                        label: l.ringBag,
                        color: const Color(0xFF9B7FC4),
                        size: 64,
                        onTap: () => _open(const ChecklistScreen(kind: ChecklistKind.bag)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (preg.week >= 28) ...[
              const SizedBox(height: 16),
              Card(
                color: AppColors.blush,
                child: ListTile(
                  leading: const Icon(Icons.celebration_outlined, color: AppColors.pink),
                  title: Text(l.babyBornQuestion, style: const TextStyle(fontWeight: FontWeight.w700)),
                  trailing: FilledButton(
                    style: FilledButton.styleFrom(minimumSize: const Size(0, 40)),
                    onPressed: _babyBorn,
                    child: Text(l.babyBornAction),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            GrowthCard(preg: preg, weights: _weights, onOpenWeights: () => _open(const WeightScreen())),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, bottom: 10),
              child: Text(l.tools, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.95,
              children: [
                _Tool(Icons.monitor_weight_outlined, l.toolWeight, () => _open(const WeightScreen())),
                _Tool(Icons.medication_outlined, l.toolMedicine, () => _open(const MedicineScreen())),
                _Tool(Icons.touch_app_outlined, l.toolKick, () => _open(const KickScreen())),
                _Tool(Icons.timer_outlined, l.toolContraction, () => _open(const ContractionScreen())),
                _Tool(Icons.shopping_bag_outlined, l.toolNeeds,
                    () => _open(const ChecklistScreen(kind: ChecklistKind.needs))),
                _Tool(Icons.luggage_outlined, l.toolBag, () => _open(const ChecklistScreen(kind: ChecklistKind.bag))),
                _Tool(Icons.health_and_safety_outlined, l.toolTests,
                    () => _open(const ChecklistScreen(kind: ChecklistKind.tests))),
                _Tool(Icons.auto_awesome_outlined, l.toolNames, () => _open(const NamesScreen())),
                _Tool(Icons.photo_library_outlined, l.toolAlbum, () => _open(const AlbumScreen())),
              ],
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: TextButton.icon(onPressed: _suggest, icon: const Icon(Icons.mail_outline), label: Text(l.suggest)),
              ),
              Expanded(
                child: TextButton.icon(onPressed: _rate, icon: const Icon(Icons.star_outline), label: Text(l.rate)),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class _WeekCard extends StatelessWidget {
  const _WeekCard({required this.preg});
  final Pregnancy preg;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final size = AppContent.current.babySize(preg.week);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 11,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ModelViewer(
                  key: ValueKey(preg.week.clamp(1, 40)),
                  src: WeekViewScreen.model(preg.week),
                  alt: L.of(context).weekN(preg.week.clamp(1, 40)),
                  backgroundColor: const Color(0xFFFFF4F6),
                  environmentImage: 'neutral',
                  exposure: 1.1,
                  shadowIntensity: 0.8,
                  cameraOrbit: '0deg 75deg auto',
                  cameraControls: false,
                  disableZoom: true,
                  autoRotate: true,
                  autoRotateDelay: 0,
                  rotationPerSecond: '20deg',
                  interactionPrompt: InteractionPrompt.none,
                  ar: false,
                ),
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => WeekViewScreen(initialWeek: preg.week)),
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 12,
                  bottom: 12,
                  child: IgnorePointer(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.view_in_ar, color: AppColors.pink),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(l.trimester(preg.trimester),
                        style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.pink)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              children: [
                Text(
                  l.weekDay(preg.week, preg.dayOfWeek),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.ink),
                ),
                if (size != null) ...[
                  const SizedBox(height: 4),
                  Text(size, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
                ],
                const SizedBox(height: 14),
                Row(
                  children: [
                    _Stat('${preg.daysPassed}', l.daysPassed),
                    _Stat('${preg.daysLeft}', l.daysLeft),
                    _Stat(dateFmtShort.format(preg.dueDate), l.dueDate),
                  ],
                ),
              ],
            ),
          ),
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
          Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.pink)),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({required this.icon, required this.label, required this.color, required this.onTap});
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.16),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.ink),
              const SizedBox(width: 8),
              Flexible(
                child: Text(label,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tool extends StatelessWidget {
  const _Tool(this.icon, this.label, this.onTap);
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
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: AppColors.blush, shape: BoxShape.circle),
                child: Icon(icon, color: AppColors.pink, size: 26),
              ),
              const SizedBox(height: 8),
              Text(label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: AppColors.ink)),
            ],
          ),
        ),
      ),
    );
  }
}
