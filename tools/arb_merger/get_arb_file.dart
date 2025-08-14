part of 'merge_arb.dart';

Future<List<File>> getArbFiles(String path) async {
  final arbFiles = <File>[];
  final dir = Directory(path);
  await for (final entity in dir.list()) {
    if (entity is File && entity.path.endsWith('.arb')) {
      arbFiles.add(entity);
    }
  }
  return arbFiles;
}
