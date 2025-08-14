part of 'merge_arb.dart';

Future<YamlMap> getYamlFileFromPubspec() async {
  final pubspec = File('pubspec.yaml');
  if (!await pubspec.exists()) {
    throw Exception('pubspec.yaml not found');
  }
  final content = await pubspec.readAsString();
  final doc = loadYaml(content);
  return doc as YamlMap;
}

Future<List<String>> getArbDirectoriesFromPubspec() async {
  final doc = await getYamlFileFromPubspec();
  final arbSection = doc['arb_directories'];

  if (arbSection == null) {
    throw Exception('arb_directories not found in pubspec.yaml');
  }
  if (arbSection is! YamlMap || arbSection['source'] == null) {
    throw Exception('source not found in arb_directories in pubspec.yaml');
  }
  final sourceDir = arbSection['source'] as String;
  if (arbSection['locales'] == null || arbSection['locales'] is! YamlList) {
    throw Exception('locales not found in arb_directories in pubspec.yaml');
  }

  final locales = List<String>.from(arbSection['locales']);
  return locales.map((locale) => '$sourceDir/$locale').toList();
}
