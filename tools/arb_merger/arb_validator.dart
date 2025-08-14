part of 'merge_arb.dart';

Future<void> validateLocaleConsistency(List<String> arbDirs) async {
  // Collect all keys for each locale with their source files
  final localeKeys = <String, Set<String>>{};
  final keySourceFiles = <String, Map<String, String>>{}; // key -> locale -> filename

  for (final dir in arbDirs) {
    final locale = dir.replaceAll('\\', '/').split('/').last;

    final arbFiles = await getArbFiles(dir);
    final keys = <String>{};

    for (final arbFile in arbFiles) {
      try {
        final arbFileMap = json.decode(await arbFile.readAsString()) as Map<String, dynamic>;
        final fileName = arbFile.path.split('/').last;

        for (final key in arbFileMap.keys) {
          keys.add(key);
          keySourceFiles.putIfAbsent(key, () => <String, String>{});
          keySourceFiles[key]![locale] = fileName;
        }
      } catch (e) {
        print('❌ Error reading ${arbFile.path}: $e');
      }
    }

    localeKeys[locale] = keys;
  }

  // Find missing keys for each locale
  final allKeys = <String>{};
  for (final keys in localeKeys.values) {
    allKeys.addAll(keys);
  }

  bool hasIssues = false;

  for (final locale in localeKeys.keys) {
    final missingKeys = allKeys.difference(localeKeys[locale]!);
    if (missingKeys.isNotEmpty) {
      hasIssues = true;
      print('❌ $locale is missing ${missingKeys.length} keys:');
      for (final key in missingKeys) {
        // Find which file contains this key in other locales
        final sourceLocales = keySourceFiles[key]!.keys.where((l) => l != locale).toList();
        if (sourceLocales.isNotEmpty) {
          final sourceLocale = sourceLocales.first;
          final sourceFile = keySourceFiles[key]![sourceLocale]!;
          print('   - $key (should be in: $sourceFile)');
        } else {
          print('   - $key');
        }
      }
    }
  }

  // Check for extra keys in each locale
  for (final locale in localeKeys.keys) {
    final extraKeys = localeKeys[locale]!.difference(allKeys);
    if (extraKeys.isNotEmpty) {
      hasIssues = true;
      print('⚠️  $locale has ${extraKeys.length} extra keys:');
      for (final key in extraKeys) {
        print('   - $key');
      }
    }
  }

  if (!hasIssues) {
    print('✅ All locales have consistent keys');
  }
}

Future<void> validateDuplicatedData(List<String> arbDirs) async {
  // Collect all data for duplicate detection
  final allKeyValuePairs = <String, Map<String, String>>{}; // key -> locale -> value
  final allValues = <String, Map<String, String>>{}; // value -> locale -> key
  final duplicateKeys = <String, List<String>>{}; // key -> list of locales with same value
  final duplicateValues = <String, List<String>>{}; // value -> list of keys with same value

  for (final dir in arbDirs) {
    final locale = dir.replaceAll('\\', '/').split('/').last;
    final arbFiles = await getArbFiles(dir);

    for (final arbFile in arbFiles) {
      try {
        final arbFileMap = json.decode(await arbFile.readAsString()) as Map<String, dynamic>;

        for (final entry in arbFileMap.entries) {
          final key = entry.key;
          final value = entry.value.toString();

          // Track key-value pairs
          allKeyValuePairs.putIfAbsent(key, () => <String, String>{});
          allKeyValuePairs[key]![locale] = value;

          // Track values for duplicate detection
          allValues.putIfAbsent(value, () => <String, String>{});
          allValues[value]![locale] = key;
        }
      } catch (e) {
        print('❌ Error reading ${arbFile.path}: $e');
      }
    }
  }

  bool hasIssues = false;

  // Check for duplicate keys with same values across locales
  for (final entry in allKeyValuePairs.entries) {
    final key = entry.key;
    final localeValues = entry.value;

    if (localeValues.length > 1) {
      // Check if all values are the same
      final uniqueValues = localeValues.values.toSet();
      if (uniqueValues.length == 1) {
        final value = uniqueValues.first;
        final locales = localeValues.keys.toList();
        duplicateKeys[key] = locales;
        hasIssues = true;
        print('⚠️  Duplicate key "$key" with same value "$value" found in locales: ${locales.join(', ')}');
      }
    }
  }

  // Check for duplicate values across different keys
  for (final entry in allValues.entries) {
    final value = entry.key;
    final localeKeys = entry.value;

    if (localeKeys.length > 1) {
      // Check if this value appears in multiple locales for different keys
      final uniqueKeys = localeKeys.values.toSet();
      if (uniqueKeys.length > 1) {
        final keys = uniqueKeys.toList();
        duplicateValues[value] = keys;
        hasIssues = true;
        print('⚠️  Duplicate value "$value" found across different keys: ${keys.join(', ')}');
        print('   Locales: ${localeKeys.keys.join(', ')}');
      }
    }
  }

  // Check for duplicate keys within the same locale (including raw file duplicates)
  for (final dir in arbDirs) {
    final locale = dir.replaceAll('\\', '/').split('/').last;
    final arbFiles = await getArbFiles(dir);
    final localeKeys = <String, List<String>>{}; // key -> list of files

    for (final arbFile in arbFiles) {
      try {
        final arbFileMap = json.decode(await arbFile.readAsString()) as Map<String, dynamic>;
        final fileName = arbFile.path.split('/').last;

        for (final key in arbFileMap.keys) {
          localeKeys.putIfAbsent(key, () => <String>[]);
          localeKeys[key]!.add(fileName);
        }
      } catch (e) {
        print('❌ Error reading ${arbFile.path}: $e');
      }
    }

    // Check for duplicates within this locale
    for (final entry in localeKeys.entries) {
      final key = entry.key;
      final files = entry.value;
      if (files.length > 1) {
        hasIssues = true;
        print('⚠️  Duplicate key "$key" found in $locale across multiple files: ${files.join(', ')}');
      }
    }
  }

  // Check for duplicate keys within individual files (raw file level)
  for (final dir in arbDirs) {
    final locale = dir.replaceAll('\\', '/').split('/').last;
    final arbFiles = await getArbFiles(dir);

    for (final arbFile in arbFiles) {
      try {
        final fileContent = await arbFile.readAsString();
        final fileName = arbFile.path.split('/').last;

        // Extract all keys from the raw file content using regex
        final keyPattern = RegExp(r'"([^"]+)"\s*:');
        final matches = keyPattern.allMatches(fileContent);
        final keys = <String>[];

        for (final match in matches) {
          keys.add(match.group(1)!);
        }

        // Check for duplicates within this file
        final seenKeys = <String>{};
        final duplicateKeysInFile = <String>[];

        for (final key in keys) {
          if (seenKeys.contains(key)) {
            duplicateKeysInFile.add(key);
          } else {
            seenKeys.add(key);
          }
        }

        if (duplicateKeysInFile.isNotEmpty) {
          hasIssues = true;
          // Use proper path formatting
          final relativePath = arbFile.path.replaceAll('\\', '/').replaceAll(RegExp(r'.*lib/l10n/'), '');
          print('⚠️  Duplicate keys found in $relativePath: ${duplicateKeysInFile.join(', ')}');
        }
      } catch (e) {
        print('❌ Error reading ${arbFile.path}: $e');
      }
    }
  }

  if (!hasIssues) {
    print('✅ No duplicates found');
  }
}
