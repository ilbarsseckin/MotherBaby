import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../l10n/app_localizations.dart';
import '../services/photos.dart';
import '../services/ads.dart';
import '../ui/theme.dart';
import '../ui/widgets.dart';

/// Ultrason fotoğrafları için 8 kutuluk albüm.
class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<File?> _photos = List.filled(Photos.slots, null);
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final p = await Photos.load();
    setState(() => _photos = p);
  }

  Future<void> _pick(int slot) async {
    final l = L.of(context);
    final hasPhoto = _photos[slot] != null;
    final action = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l.ultrasoundPhoto, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text(l.takePhoto),
              onTap: () => Navigator.pop(c, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l.pickGallery),
              onTap: () => Navigator.pop(c, 'gallery'),
            ),
            if (hasPhoto) ...[
              ListTile(
                leading: const Icon(Icons.share_outlined),
                title: Text(l.share),
                onTap: () => Navigator.pop(c, 'share'),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: Text(l.remove, style: const TextStyle(color: Colors.red)),
                onTap: () => Navigator.pop(c, 'remove'),
              ),
            ],
          ],
        ),
      ),
    );
    switch (action) {
      case 'camera':
      case 'gallery':
        try {
          final x = await _picker.pickImage(
            source: action == 'camera' ? ImageSource.camera : ImageSource.gallery,
            maxWidth: 2000,
            imageQuality: 88,
          );
          if (x == null) return;
          await Photos.put(slot, x.path);
          _load();
        } catch (_) {
          if (mounted) showSnack(context, l.photoError);
        }
      case 'share':
        await SharePlus.instance.share(ShareParams(files: [XFile(_photos[slot]!.path)], text: l.shareText));
      case 'remove':
        await Photos.remove(slot);
        _load();
    }
  }

  Future<void> _shareAll() async {
    final l = L.of(context);
    final files = _photos.whereType<File>().map((f) => XFile(f.path)).toList();
    if (files.isEmpty) {
      showSnack(context, l.addPhotosFirst);
      return;
    }
    await SharePlus.instance.share(ShareParams(files: files, text: l.shareAllText));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Scaffold(
      bottomNavigationBar: const BannerAdWidget(),
      appBar: AppBar(
        title: Text(l.toolAlbum),
        actions: [IconButton(tooltip: l.shareAll, icon: const Icon(Icons.ios_share), onPressed: _shareAll)],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: Photos.slots,
        itemBuilder: (_, i) {
          final f = _photos[i];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => _pick(i),
              child: f != null
                  ? Image.file(f, fit: BoxFit.cover, cacheWidth: 600)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/img/ultrasound.png', width: 56, opacity: const AlwaysStoppedAnimation(0.6)),
                        const SizedBox(height: 8),
                        Text(l.photoN(i + 1), style: const TextStyle(color: AppColors.pink, fontWeight: FontWeight.w600)),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
