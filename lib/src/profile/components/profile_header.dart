import 'package:app/common_lib.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return Container(
      width: double.infinity,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        gradient: ConstantColors.primaryGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(Insets.extraSmall),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: ConstantColors.primaryGradient,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
              ),
            ),
            const Gap(Insets.small),
            Text(
              'Karam Rasheed',
              style: textTheme.headlineLarge?.copyWith(
                color: ConstantColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('SoftWare Engineer', style: textTheme.labelLarge?.copyWith(color: ConstantColors.white)),
          ],
        ),
      ),
    );
  }
}
