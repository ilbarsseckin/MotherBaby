import 'package:flutter/material.dart';

import '../data/db.dart';
import '../data/profile.dart';
import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../l10n/language.dart';
import '../services/ads.dart';
import '../services/notifications.dart';
import '../services/photos.dart';
import '../ui/premium_card.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';
import 'home_screen.dart';

/// İlk açılıştaki kayıt ekranı ve sonradan Ayarlar ekranı.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.onboarding = false});
  final bool onboarding;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _name = TextEditingController();
  String _sex = 'unknown';
  String _kin = 'mother';
  DateMode _mode = DateMode.lastPeriod;
  DateTime? _date;
  DateTime? _birthDate;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final p = await Profile.load();
    if (p != null) {
      _name.text = p.babyName;
      _sex = p.sex;
      _kin = p.kin;
      _mode = p.mode;
      _date = p.date;
      _birthDate = p.birthDate;
    }
    setState(() => _loading = false);
  }

  Future<void> _pickDate() async {
    final l = L.of(context);
    final today = DateTime.now();
    final lmp = _mode == DateMode.lastPeriod;
    final first = lmp ? today.subtract(const Duration(days: 300)) : today.subtract(const Duration(days: 14));
    final last = lmp ? today : today.add(const Duration(days: 300));
    var initial = _date ?? (lmp ? today.subtract(const Duration(days: 60)) : today.add(const Duration(days: 180)));
    if (initial.isBefore(first)) initial = first;
    if (initial.isAfter(last)) initial = last;
    final d = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
      helpText: lmp ? l.lastPeriodLong : l.dueDateLong,
    );
    if (d != null) setState(() => _date = d);
  }

  Future<void> _save() async {
    final l = L.of(context);
    final name = _name.text.trim();
    if (name.length < 2) {
      showSnack(context, l.nameRequired);
      return;
    }
    if (_date == null) {
      showSnack(context, l.dateRequired);
      return;
    }
    await Profile(babyName: name, sex: _sex, kin: _kin, mode: _mode, date: _date!, birthDate: _birthDate).save();
    await Notifications.scheduleMilestones();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (_) => false,
    );
  }

  Future<void> _setLanguage(String? code) async {
    await LanguageController.instance.set(code);
    await Notifications.rescheduleAll();
    await Notifications.scheduleMilestones();
  }

  Future<void> _factoryReset() async {
    final l = L.of(context);
    final ok = await confirm(context, l.factoryResetTitle, l.factoryResetMessage);
    if (!ok) return;
    await Notifications.cancelAll();
    await AppDb.resetAll();
    await Photos.clearAll();
    await Profile.clear();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const ProfileScreen(onboarding: true)),
      (_) => false,
    );
  }

  Widget _languagePicker(L l) {
    return DropdownButtonFormField<String?>(
      initialValue: LanguageController.instance.value,
      isExpanded: true,
      decoration: InputDecoration(labelText: l.language, prefixIcon: const Icon(Icons.language)),
      items: [
        DropdownMenuItem<String?>(value: null, child: Text(l.languageSystem)),
        for (final e in languages.entries) DropdownMenuItem<String?>(value: e.key, child: Text(e.value)),
      ],
      onChanged: _setLanguage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final lmp = _mode == DateMode.lastPeriod;
    return Scaffold(
      appBar: widget.onboarding ? null : AppBar(title: Text(l.settings)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          children: [
            if (widget.onboarding) ...[
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: SizedBox(width: 200, child: _languagePicker(l)),
              ),
              const SizedBox(height: 8),
              Center(child: Image.asset('assets/icon/app_icon.png', width: 110)),
              const SizedBox(height: 16),
              Text(l.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.ink)),
              const SizedBox(height: 6),
              Text(l.welcomeSubtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade700)),
              const SizedBox(height: 28),
            ],
            TextField(
              controller: _name,
              maxLength: 20,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: l.babyName, prefixIcon: const Icon(Icons.child_care)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _sex,
                    isExpanded: true,
                    decoration: InputDecoration(labelText: l.sexLabel),
                    items: [for (final s in Profile.sexes) DropdownMenuItem(value: s, child: Text(l.sex(s)))],
                    onChanged: (v) => setState(() => _sex = v!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _kin,
                    isExpanded: true,
                    decoration: InputDecoration(labelText: l.kinLabel),
                    items: [for (final s in Profile.kins) DropdownMenuItem(value: s, child: Text(l.kin(s)))],
                    onChanged: (v) => setState(() => _kin = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(l.whichDate, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            SegmentedButton<DateMode>(
              segments: [
                ButtonSegment(value: DateMode.lastPeriod, label: Text(l.lastPeriod)),
                ButtonSegment(value: DateMode.dueDate, label: Text(l.dueDateShort)),
              ],
              selected: {_mode},
              onSelectionChanged: (s) => setState(() {
                _mode = s.first;
                _date = null;
              }),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.event, color: AppColors.pink),
                title: Text(lmp ? l.lastPeriodLong : l.dueDateLong),
                subtitle: Text(_date == null ? l.tapToSelect : dateFmt.format(_date!)),
                trailing: const Icon(Icons.chevron_right),
                onTap: _pickDate,
              ),
            ),
            if (_date != null) ...[
              const SizedBox(height: 10),
              Builder(builder: (_) {
                final p = Profile(babyName: '', sex: _sex, kin: _kin, mode: _mode, date: _date!);
                final preg = p.pregnancy;
                return Text(
                  l.profilePreview(dateFmt.format(p.dueDate), preg.week, preg.dayOfWeek),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.pink, fontWeight: FontWeight.w600),
                );
              }),
            ],
            const SizedBox(height: 28),
            FilledButton(onPressed: _save, child: Text(widget.onboarding ? l.begin : l.save)),
            if (!widget.onboarding && _birthDate == null) ...[
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context, 'born'),
                icon: const Icon(Icons.celebration_outlined),
                label: Text(l.babyBornAction),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              ),
            ],
            if (!widget.onboarding && _birthDate != null) ...[
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.cake_outlined, color: AppColors.pink),
                  title: Text(l.birthDateLabel),
                  subtitle: Text(dateFmt.format(_birthDate!)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final d = await showDatePicker(
                      context: context,
                      initialDate: _birthDate!,
                      firstDate: DateTime.now().subtract(const Duration(days: 800)),
                      lastDate: DateTime.now(),
                    );
                    if (d != null) setState(() => _birthDate = d);
                  },
                ),
              ),
              TextButton(
                onPressed: () => setState(() => _birthDate = null),
                child: Text(l.backToPregnancy),
              ),
            ],
            if (!widget.onboarding) ...[
              const PremiumCard(),
              const SizedBox(height: 28),
              _languagePicker(l),
              ValueListenableBuilder<bool>(
                valueListenable: Notifications.milestonesEnabled,
                builder: (_, on, _) => SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.notifications_active_outlined),
                  title: Text(l.weeklyNotifSetting),
                  value: on,
                  onChanged: Notifications.setMilestonesEnabled,
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: Notifications.dailyEnabled,
                builder: (_, on, _) => SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.wb_sunny_outlined),
                  title: Text(l.dailyMsgSetting),
                  value: on,
                  onChanged: Notifications.setDailyEnabled,
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: Ads.privacyOptionsRequired,
                builder: (_, required, _) => required
                    ? Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextButton.icon(
                          onPressed: Ads.showPrivacyOptions,
                          icon: const Icon(Icons.privacy_tip_outlined),
                          label: Text(l.privacyOptions),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: _factoryReset,
                icon: const Icon(Icons.delete_forever_outlined),
                label: Text(l.factoryReset),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
