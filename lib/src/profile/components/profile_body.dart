import 'package:app/common_lib.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/theme_mode.dart';
import 'package:app/core/utils/widgets/buttons/change_language_button.dart';
import 'package:app/data/providers/authentication_provider.dart';
import 'package:app/src/components/gardient_button.dart';
import 'package:app/src/profile/components/custom_profile_option.dart';
import 'package:app/src/profile/components/theme_switch.dart';
import 'package:flutter/material.dart';

import 'package:app/src/notification/components/app_dialog.dart';

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
              CustomProfileOption(
                title: l10n.skills,
                icon: Assets.assetsSvgSkill,
                onPressed: () {
                  context.push(RoutesDocument.skills);
                },
              ),
              CustomProfileOption(
                title: l10n.language,
                icon: Assets.assetsSvgLanguage,
                trailing: ChangeLanguageButton(),
              ),
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
        SizedBox(
          width: double.infinity,
          child: GradientButton(
            gradient: ConstantColors.redVibrant(),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AppDialog(
                  title: l10n.logout,
                  content: l10n.areYouSureLogout,
                  actions: [
                    TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.cancel)),

                    GradientButton(
                      gradient: ConstantColors.redVibrant(),
                      onPressed: () {
                        ref.read(authenticationProvider.notifier).logout();
                      },
                      text: l10n.logout,
                    ),
                  ],
                ),
              );
            },
            text: context.l10n.logout,
          ),
        ),
        Gap(navBarHeight),
      ],
    ).withMargin(Insets.smallAll);
  }
}
