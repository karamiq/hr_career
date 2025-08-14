import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class EmptyNotifications extends ConsumerWidget {
  const EmptyNotifications({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    final appColors = ref.watch(appColorsProvider);
    return ColumnPadded(
      gap: Insets.small,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: context.colorScheme.onBackground,
          radius: 100,
          child: SvgPicture.asset(Assets.assetsSvgNotificationsEmpty, height: 130, color: appColors.text),
        ),
        const Gap(Insets.medium),
        Text(
          'No notifications\navailable',
          textAlign: TextAlign.center,
          style: textTheme.headlineLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        Text(
          'Contact the technical support team to fix the issue quickly and effectively',
          textAlign: TextAlign.center,
        ).withPadding(EdgeInsets.symmetric(horizontal: Insets.large)),
        const Gap(Insets.medium),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(vertical: Insets.medium),
            ),
            onPressed: onPressed,
            child: Text(
              'Reload',
              style: textTheme.labelLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ConstantColors.white,
              ),
            ),
          ),
        ),
        Gap(context.height * 0.1),
      ],
    ).withPadding(Insets.mediumAll);
  }
}
