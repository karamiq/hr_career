import 'package:app/common_lib.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/theme_mode.dart';
import 'package:app/data/providers/authentication_provider.dart';
import 'package:app/src/components/gardient_button.dart';
import 'package:app/src/profile/components/custom_profile_option.dart';
import 'package:app/src/profile/components/theme_switch.dart';
import 'package:flutter/material.dart';

class ProfileBody extends ConsumerWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;
    final isDark = ref.watch(settingsProvider).themeMode.isDark;

    return ColumnPadded(
      gap: Insets.small,
      children: [
        Card(
          margin: Insets.noneAll,
          elevation: 0,
          color: colorScheme.onBackground,
          child: Column(
            children: [
              CustomProfileOption(
                title: l10n.accountDetails,
                icon: Assets.assetsSvgProfile,
                onPressed: () {},
              ),
              CustomProfileOption(
                title: l10n.changePassword,
                icon: Assets.assetsSvgPassword,
                onPressed: () {},
              ),
              CustomProfileOption(title: l10n.documents, icon: Assets.assetsSvgDocument, onPressed: () {}),
              CustomProfileOption(
                title: l10n.certifications,
                icon: Assets.assetsSvgCirtification,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Card(
          margin: Insets.noneAll,
          elevation: 0,
          color: colorScheme.onBackground,
          child: Column(
            children: [
              CustomProfileOption(title: l10n.skills, icon: Assets.assetsSvgSkill, onPressed: () {}),
              CustomProfileOption(title: l10n.language, icon: Assets.assetsSvgLanguage),
              CustomProfileOption(
                title: isDark ? l10n.lightMode : l10n.darkMode,
                icon: isDark ? Assets.assetsSvgSun : Assets.assetsSvgMoon,
                trailing: ThemeSwitch(
                  value: isDark,
                  onChanged: (value) {
                    ref.read(settingsProvider.notifier).toggleThemeMode(context);
                  },
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: Insets.noneAll,
          color: colorScheme.onBackground,
          elevation: 0,
          child: Column(
            children: [
              CustomProfileOption(title: l10n.about, icon: Assets.assetsSvgAbout, onPressed: () {}),
              CustomProfileOption(title: l10n.support, icon: Assets.assetsSvgChat, onPressed: () {}),
            ],
          ),
        ),
        const Gap(Insets.extraSmall),
        GradientButton(
          gradient: ConstantColors.redVibrant,
          onPressed: () {
            ConfirmationDialog.show(
              context,
              title: 'تسجيل الخروج',
              content: 'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
              confirmText: 'تسجيل الخروج',
              cancelText: 'إلغاء',
              onConfirm: () {
                ref.read(authenticationProvider.notifier).logout();
              },
            );
          },
          text: context.l10n.logout,
        ),
        Gap(navBarHeight),
      ],
    ).withMargin(Insets.smallAll);
  }
}

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String content,
    required String confirmText,
    required String cancelText,
    required VoidCallback onConfirm,
    Color? confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          content: content,
          confirmText: confirmText,
          cancelText: cancelText,
          onConfirm: onConfirm,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText, style: TextStyle(color: Colors.grey[600])),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE57373),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(confirmText, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
