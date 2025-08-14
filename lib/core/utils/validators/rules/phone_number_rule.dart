import 'package:app/core/utils/validators/validation_rule.dart';

class PhoneNumberRule extends ValidatorRule {
  @override
  final Map<String, String> defaultMessage = {'en': 'Invalid phone number', 'ar': 'رقم هاتف غير صالح'};

  PhoneNumberRule([super.errorMessage]);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    // Accepts numbers like +9647512345678 or 07512345678
    return RegExp(r'^(\+?\d{7,15})$').hasMatch(value);
  }
}
