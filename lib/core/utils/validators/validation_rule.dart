import 'package:app/core/providers/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show WidgetRef;

abstract class ValidatorRule {
  final String? errorMessage;

  bool isValid(String? vlue);
  abstract final Map<String, String> defaultMessage;

  const ValidatorRule([this.errorMessage]);

  String? getMessage(WidgetRef ref) =>
      errorMessage ?? defaultMessage[ref.read(settingsProvider).locale.languageCode ?? 'en'];
}
