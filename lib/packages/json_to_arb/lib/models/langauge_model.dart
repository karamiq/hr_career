import 'dart:io';

class LangaugeModel {
  final String code;
  final List<String> jsonFilesPaths;
  final List<File> jsonFiles;

  LangaugeModel({required this.code, required this.jsonFilesPaths, required this.jsonFiles});
}
