import 'package:flutter/material.dart';

import '../data/content.dart';
import '../data/db.dart';
import '../l10n/app_localizations.dart';
import '../services/ads.dart';
import '../ui/theme.dart';

/// İhtiyaç listesi, doğum çantası ve sağlık testleri için ortak ekran.
class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key, required this.kind});
  final ChecklistKind kind;

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  List<ChecklistItem> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await ChecklistRepo.items(widget.kind);
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  Future<void> _toggle(ChecklistItem i) async {
    await ChecklistRepo.setDone(i.id, !i.done);
    _load();
  }

  Future<void> _add() async {
    final l = L.of(context);
    final ctrl = TextEditingController();
    final text = await showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(l.newItem),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          onSubmitted: (v) => Navigator.pop(c, v),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(88, 40)),
            onPressed: () => Navigator.pop(c, ctrl.text),
            child: Text(l.add),
          ),
        ],
      ),
    );
    if (text == null || text.trim().isEmpty) return;
    await ChecklistRepo.add(widget.kind, text.trim());
    _load();
  }

  String _title(L l) => switch (widget.kind) {
        ChecklistKind.needs => l.toolNeeds,
        ChecklistKind.bag => l.toolBag,
        ChecklistKind.tests => l.toolTests,
      };

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final done = _items.where((e) => e.done).length;
    final groups = <String, List<ChecklistItem>>{};
    for (final i in _items) {
      groups.putIfAbsent(i.grp, () => []).add(i);
    }
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(title: Text(_title(l))),
      floatingActionButton: widget.kind == ChecklistKind.tests
          ? null
          : FloatingActionButton(onPressed: _add, tooltip: l.addItem, child: const Icon(Icons.add)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 96),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l.progressLabel(done, _items.length),
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: _items.isEmpty ? 0 : done / _items.length,
                            minHeight: 10,
                            backgroundColor: AppColors.blush,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                for (final g in groups.entries) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 18, 4, 8),
                    child: Text(
                      g.key == 'custom' ? l.customGroup : AppContent.current.groupName(widget.kind.name, g.key),
                      style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.pink, fontSize: 15),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        for (final i in g.value)
                          CheckboxListTile(
                            value: i.done,
                            onChanged: (_) => _toggle(i),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              i.title,
                              style: TextStyle(
                                decoration: i.done ? TextDecoration.lineThrough : null,
                                color: i.done ? Colors.grey : AppColors.ink,
                              ),
                            ),
                            secondary: i.custom
                                ? IconButton(
                                    icon: const Icon(Icons.close, size: 20),
                                    tooltip: l.remove,
                                    onPressed: () async {
                                      await ChecklistRepo.remove(i.id);
                                      _load();
                                    },
                                  )
                                : null,
                          ),
                      ],
                    ),
                  ),
                ],
                if (widget.kind == ChecklistKind.tests)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l.testsDisclaimer,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12.5),
                    ),
                  ),
              ],
            ),
    );
  }
}
