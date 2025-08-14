import 'package:app/common_lib.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/src/components/gradient_icon.dart';
import 'package:flutter/material.dart';

class ChangeLanguageButton extends HookConsumerWidget {
  const ChangeLanguageButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final appColors = ref.watch(appColorsProvider);
    final style = TextStyle(color: appColors.foreGround, fontSize: 16, fontWeight: FontWeight.w500);
    return DropdownButton(
      value: settings.localeCode,
      onChanged: (value) {
        if (value != null) {
          ref.read(settingsProvider.notifier).setLocale(Locale(value));
        }
      },
      items: [
        DropdownMenuItem(
          value: 'en',
          child: Text(" English ", style: style),
        ),
        DropdownMenuItem(
          value: 'ar',
          child: Text(" العربية ", style: style),
        ),
        DropdownMenuItem(
          value: 'ja',
          child: Text("日本語", style: style),
        ),
      ],
      icon: GradientIcon(Icons.language_outlined),
      underline: const SizedBox(),
    );
  }
}
