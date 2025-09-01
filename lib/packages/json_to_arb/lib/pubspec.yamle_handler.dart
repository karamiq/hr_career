part of 'json_to_arb.dart';

Future<YamlMap> getYamlFileFromPubspec() async {
  final pubspec = File('pubspec.yaml');
  if (!await pubspec.exists()) {
    throw Exception('pubspec.yaml not found');
  }
  final content = await pubspec.readAsString();
  final doc = loadYaml(content);
  return doc as YamlMap;
}

Future<List<String>> getLocals() async {
  final doc = await getYamlFileFromPubspec();
  final jsonToArb = doc[Names.jsonToArb];

  if (jsonToArb == null) {
    throw Exception('json_directories not found in pubspec.yaml');
  }
  if (jsonToArb is! YamlMap || jsonToArb[Names.source] == null) {
    throw Exception('${Names.source} not found in arb_directories in pubspec.yaml');
  }
  final yamelLocals = jsonToArb[Names.locales];

  if (yamelLocals == null || yamelLocals is! YamlList) {
    throw Exception('${Names.locales} not found in arb_directories in pubspec.yaml');
  }
  final locals = List<String>.from(yamelLocals);
  return locals;
}

Future<List<File>> getJsonFilesForEachLangauge(LangaugeModel langauge) async {
  throw UnimplementedError('getJsonFilesForEachLangauge is not yet implemented');
}
