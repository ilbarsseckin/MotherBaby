import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Ultrason albümü: 8 kutucuk, fotoğraflar uygulamanın kendi klasörüne kopyalanır.
class Photos {
  Photos._();
  static const slots = 8;

  static Future<Directory> _dir() async {
    final base = await getApplicationDocumentsDirectory();
    final d = Directory(p.join(base.path, 'album'));
    if (!await d.exists()) await d.create(recursive: true);
    return d;
  }

  /// Her kutucuk için dosya (yoksa null).
  static Future<List<File?>> load() async {
    final d = await _dir();
    final files = d.listSync().whereType<File>().toList();
    return List.generate(slots, (i) {
      final matches = files.where((f) => p.basename(f.path).startsWith('slot${i}_')).toList();
      return matches.isEmpty ? null : matches.first;
    });
  }

  static Future<File> put(int slot, String sourcePath) async {
    await remove(slot);
    final d = await _dir();
    final ext = p.extension(sourcePath).isEmpty ? '.jpg' : p.extension(sourcePath);
    // Zaman damgası, görüntü önbelleğinin eski fotoğrafı göstermesini önler.
    final target = p.join(d.path, 'slot${slot}_${DateTime.now().millisecondsSinceEpoch}$ext');
    return File(sourcePath).copy(target);
  }

  static Future<void> remove(int slot) async {
    final d = await _dir();
    for (final f in d.listSync().whereType<File>()) {
      if (p.basename(f.path).startsWith('slot${slot}_')) await f.delete();
    }
  }

  static Future<void> clearAll() async {
    final d = await _dir();
    if (await d.exists()) await d.delete(recursive: true);
  }
}
