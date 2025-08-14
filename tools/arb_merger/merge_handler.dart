part of 'merge_arb.dart';

Future<void> mergeArbFiles(String sourceDir, String outputFile) async {
  final dir = Directory(sourceDir);
  if (!await dir.exists()) {
    print('Directory not found: $sourceDir');
    return;
  }

  final merged = <String, dynamic>{};
  await for (final entity in dir.list()) {
    if (entity is File && entity.path.endsWith('.arb')) {
      try {
        final content = await entity.readAsString();
        final map = json.decode(content) as Map<String, dynamic>;
        merged.addAll(map);
        // Normalize path to use forward slashes
        final normalizedPath = entity.path.replaceAll('\\', '/');
        print('  - Successfully processed: $normalizedPath');
      } catch (e) {
        // Normalize path to use forward slashes
        final normalizedPath = entity.path.replaceAll('\\', '/');
        print('  - Error processing $normalizedPath: $e');
        print('  - File content preview:');
        try {
          final content = await entity.readAsString();
          final lines = content.split('\n');
          for (int i = 0; i < lines.length; i++) {
            print('    Line ${i + 1}: ${lines[i]}');
          }
        } catch (readError) {
          print('    Could not read file content: $readError');
        }
        rethrow;
      }
    }
  }

  if (merged.isEmpty) {
    print('No valid ARB files found in $sourceDir');
    return;
  }

  try {
    final encoder = JsonEncoder.withIndent('  ');
    final output = encoder.convert(merged);
    await File(outputFile).writeAsString('$output\n');
    // Normalize output path to use forward slashes
    final normalizedOutputFile = outputFile.replaceAll('\\', '/');
    final normalizedSourceDir = sourceDir.replaceAll('\\', '/');
    print('Merged $normalizedSourceDir into $normalizedOutputFile');
  } catch (e) {
    print('Error writing output file $outputFile: $e');
    rethrow;
  }
}
