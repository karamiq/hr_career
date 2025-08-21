// ignore_for_file: deprecated_member_use
import 'package:app/utils/constants/assets.dart';
import 'package:app/core/utils/extensions.dart' hide ValidatorX;
import 'package:app/src/components/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../validators/validators.dart';

class PasswordFormField extends ConsumerWidget {
  const PasswordFormField({
    super.key,
    required this.rules,
    this.errorText,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
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
    this.textDirection,
  });
  final TextDirection? textDirection;
  final List<ValidatorRule> rules;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
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
    final obscureText = ValueNotifier<bool>(true);

    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (context, isObscured, child) {
        final defaultDecoration = InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            color: theme.colorScheme.primary,

            icon: GradientIcon(isObscured ? Assets.assetsSvgClosedEye : Assets.assetsSvgEye),
            onPressed: () => obscureText.value = !obscureText.value,
          ),
          errorText: errorText,
          filled: true,
          fillColor: theme.colorScheme.onBackground,
        );

        return TextFormField(
          textDirection: textDirection,
          controller: controller,
          focusNode: focusNode,

          decoration:
              decoration?.copyWith(
                suffixIcon:
                    decoration?.suffixIcon ??
                    IconButton(
                      color: theme.colorScheme.primary,
                      iconSize: 20,
                      icon: SvgPicture.asset(
                        isObscured ? Assets.assetsSvgClosedEye : Assets.assetsSvgEye,
                        color: context.colorScheme.secondary,
                      ),
                      onPressed: () => obscureText.value = !obscureText.value,
                    ),
                prefixIcon: decoration?.prefixIcon ?? prefixIcon,
                hintText: decoration?.hintText ?? hintText,
                labelText: decoration?.labelText ?? labelText,
                errorText: errorText,
              ) ??
              defaultDecoration,
          validator: (value) => ValidatorX.validate(ref, value, rules),
          obscureText: isObscured,
          keyboardType: keyboardType,
          textInputAction:
              textInputAction ?? (nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
          enabled: enabled,
          autofocus: autofocus,
          maxLines: isObscured ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          onFieldSubmitted: (value) {
            onFieldSubmitted?.call(value);
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
        );
      },
    );
  }
}
