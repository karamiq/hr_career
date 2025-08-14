import 'dart:convert';
import 'dart:io';
import 'package:yaml/yaml.dart';

part 'pubspec.yamle_handler.dart';
part 'output_handler.dart';
part 'merge_handler.dart';
part 'arb_validator.dart';
part 'get_arb_file.dart';

void main() async {
  final arbDirs = await getArbDirectoriesFromPubspec();
  if (arbDirs.isEmpty) {
    print(
      'No ARB directories found in the source directory specified in pubspec.yaml under arb_directories.',
    );
    return;
  }

  final outputDir = await getOutputDirectoryFromPubspec();
  final outputDirectory = Directory(outputDir);
  if (!await outputDirectory.exists()) {
    await outputDirectory.create(recursive: true);
  }

  // Normalize output directory path to use forward slashes
  final normalizedOutputDir = outputDir.replaceAll('\\', '/');
  print('Output directory: $normalizedOutputDir');
  for (final dir in arbDirs) {
    // Extract just the locale name from the full path
    // Handle both forward slashes and backslashes
    final locale = dir.replaceAll('\\', '/').split('/').last;
    final outputFile = '$outputDir/app_$locale.arb';
    await mergeArbFiles(dir, outputFile);
  }

  await validateDuplicatedData(arbDirs);
  await validateLocaleConsistency(arbDirs);
}
