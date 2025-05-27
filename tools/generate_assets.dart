import 'dart:io';

void main() async {
  final assetsDir = Directory('assets/images');
  final outputFile = File('lib/assets_manager.dart');
  if (!assetsDir.existsSync()) {
    print('📁 مجلد assets/images غير موجود. يتم إنشاؤه الآن...');
    assetsDir.createSync(recursive: true);
    print('✅ تم إنشاء المجلد بنجاح. أضف صورك داخله وأعد تشغيل السكربت.');
    return;
  }

  final buffer = StringBuffer();
  buffer.writeln('// GENERATED FILE. DO NOT MODIFY BY HAND.');
  buffer.writeln('// ignore_for_file: constant_identifier_names');
  buffer.writeln('\nclass Assets {');

  final imageExtensions = ['.png', '.jpg', '.jpeg', '.svg', '.webp'];

  final files = assetsDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) {
    final ext = f.path.split('.').last.toLowerCase();
    return imageExtensions.contains('.$ext');
  });

  for (var file in files) {
    final relativePath = file.path.replaceAll('\\', '/');
    final assetPath = relativePath;

    final fullName = relativePath.replaceFirst('assets/images/', '');
    final fileName = fullName.split('/').last;
    final nameWithoutExtension = fileName.split('.').first;
    final extension = fileName.split('.').last.toLowerCase();

    // تحويل الاسم إلى lowerCamelCase
    final words = nameWithoutExtension
        .split(RegExp(r'[^a-zA-Z0-9]'))
        .where((w) => w.isNotEmpty)
        .toList();

    final camelCaseName = words.asMap().entries.map((entry) {
      final word = entry.value.toLowerCase();
      return entry.key == 0 ? word : word[0].toUpperCase() + word.substring(1);
    }).join();

    final finalName = '$camelCaseName${extension[0].toUpperCase()}${extension.substring(1)}';

    buffer.writeln("  static const String $finalName = '$assetPath';");
  }

  buffer.writeln('}');

  await outputFile.create(recursive: true);
  await outputFile.writeAsString(buffer.toString());

  print('✅ تم إنشاء ملف assets_manager.dart بنجاح!');
}
