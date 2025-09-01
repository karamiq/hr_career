part of 'json_to_arb.dart';

Future<String> getOutputDirectoryFromPubspec() async {
  final doc = await getYamlFileFromPubspec();
  final arbSection = doc['arb_directories'];

  if (arbSection == null) {
    throw Exception('arb_directories not found in pubspec.yaml');
  }
  if (arbSection is! YamlMap || arbSection['output'] == null) {
    throw Exception('output not found in arb_directories in pubspec.yaml');
  }

  return arbSection['output'] as String;
}
