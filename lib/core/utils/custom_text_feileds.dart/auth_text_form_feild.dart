import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../validators/validators.dart';

class AuthFormField extends ConsumerWidget {
  const AuthFormField({
    super.key,
    this.errorText,
    required this.rules,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.enabled = true,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.decoration,
    this.readOnly = false,
    this.onTap,
    this.textDirection,
  });
  final TextDirection? textDirection;
  final List<ValidatorRule> rules;
  final bool readOnly;
  final void Function()? onTap;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final defaultDecoration = InputDecoration(
      hintText: hintText,
      labelText: labelText,
      suffixIcon: suffixIcon,
      errorText: errorText,
      filled: true,
      fillColor: theme.colorScheme.onBackground,
    );

    return TextFormField(
      textDirection: textDirection,
      autofillHints: const [AutofillHints.telephoneNumber],
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      decoration: decoration ?? defaultDecoration,
      validator: (value) => ValidatorX.validate(ref, value, rules),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction:
          textInputAction ?? (nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
      enabled: enabled,
      autofocus: autofocus,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
    );
  }
}
