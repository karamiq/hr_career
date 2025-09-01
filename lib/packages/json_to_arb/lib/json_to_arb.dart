import 'dart:convert';
import 'dart:io';
import 'package:json_to_arb/models/langauge_model.dart';
import 'package:yaml/yaml.dart';

part 'pubspec.yamle_handler.dart';
part 'get_json_files.dart';
part 'output_handler.dart';

void main() async {
  final doc = await getYamlFileFromPubspec();
  final List<LangaugeModel> languages = [];
}




// arb_directories:
//   source: lib/l10n
//   output: lib/l10n/app_arb
//   locales:
//     - en
//     - ar