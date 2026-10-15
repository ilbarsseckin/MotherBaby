import 'package:flutter/material.dart';

import '../data/db.dart';
import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../services/notifications.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  List<Medicine> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await MedicineRepo.all();
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  Future<void> _save(Medicine m) async {
    final id = await MedicineRepo.save(m);
    final saved = Medicine(id: id, name: m.name, hour: m.hour, minute: m.minute, meal: m.meal, active: m.active);
    if (saved.active) {
      final granted = await Notifications.requestPermission();
      if (!granted && mounted) {
        showSnack(context, L.of(context).notifPermissionDenied);
      }
    }
    await Notifications.schedule(saved);
    await _load();
  }

  Future<void> _edit([Medicine? m]) async {
    final result = await showModalBottomSheet<Medicine>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _MedicineForm(initial: m),
    );
    if (result != null) await _save(result);
  }

  Future<void> _delete(Medicine m) async {
    await Notifications.cancel(m.id!);
    await MedicineRepo.remove(m.id!);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(l.toolMedicine)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _edit(),
        icon: const Icon(Icons.add),
        label: Text(l.medAdd),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _items.isEmpty
              ? EmptyState(icon: Icons.medication_outlined, text: l.medEmpty)
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
                  children: [
                    for (final m in _items)
                      Dismissible(
                        key: ValueKey(m.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red.shade100,
                          child: const Icon(Icons.delete_outline),
                        ),
                        onDismissed: (_) => _delete(m),
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            onTap: () => _edit(m),
                            leading: CircleAvatar(
                              backgroundColor: AppColors.blush,
                              child: const Icon(Icons.medication, color: AppColors.pink),
                            ),
                            title: Text(m.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                            subtitle: Text(l.medDaily(m.timeText, l.meal(m.meal))),
                            trailing: Switch(
                              value: m.active,
                              onChanged: (v) => _save(Medicine(
                                  id: m.id, name: m.name, hour: m.hour, minute: m.minute, meal: m.meal, active: v)),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(l.swipeToDelete,
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    ),
                  ],
                ),
    );
  }
}

class _MedicineForm extends StatefulWidget {
  const _MedicineForm({this.initial});
  final Medicine? initial;

  @override
  State<_MedicineForm> createState() => _MedicineFormState();
}

class _MedicineFormState extends State<_MedicineForm> {
  late final _name = TextEditingController(text: widget.initial?.name ?? '');
  late TimeOfDay _time = widget.initial == null
      ? const TimeOfDay(hour: 9, minute: 0)
      : TimeOfDay(hour: widget.initial!.hour, minute: widget.initial!.minute);
  late String _meal = widget.initial?.meal ?? 'any';
  late bool _active = widget.initial?.active ?? true;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.initial == null ? l.medNew : l.medEdit,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          TextField(
            controller: _name,
            autofocus: widget.initial == null,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(labelText: l.medName),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.schedule, color: AppColors.pink),
              title: Text(l.medTime),
              trailing: Text(_time.format(context), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              onTap: () async {
                final t = await showTimePicker(
                  context: context,
                  initialTime: _time,
                  builder: (c, child) =>
                      MediaQuery(data: MediaQuery.of(c).copyWith(alwaysUse24HourFormat: true), child: child!),
                );
                if (t != null) setState(() => _time = t);
              },
            ),
          ),
          const SizedBox(height: 12),
          SegmentedButton<String>(
            segments: [for (final m in Medicine.meals) ButtonSegment(value: m, label: Text(l.meal(m)))],
            selected: {_meal},
            onSelectionChanged: (s) => setState(() => _meal = s.first),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l.medReminderOn),
            value: _active,
            onChanged: (v) => setState(() => _active = v),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () {
              final name = _name.text.trim();
              if (name.isEmpty) return;
              Navigator.pop(
                context,
                Medicine(
                  id: widget.initial?.id,
                  name: name,
                  hour: _time.hour,
                  minute: _time.minute,
                  meal: _meal,
                  active: _active,
                ),
              );
            },
            child: Text(l.save),
          ),
        ],
      ),
    );
  }
}
