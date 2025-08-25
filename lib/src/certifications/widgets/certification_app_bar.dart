import 'package:app/common_lib.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CertificationAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;

  const CertificationAppBar({super.key, required this.title, required this.subtitle, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          decoration: BoxDecoration(
            gradient: ConstantColors.primaryGradient(),
            borderRadius: BorderSize.largeRadius,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Insets.large),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(Insets.extraLarge),
                  // Page title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(iconPath, color: ConstantColors.white, height: 30, width: 30),
                      const Gap(Insets.extraSmall),
                      Text(
                        title,
                        style: textTheme.headlineMedium?.copyWith(
                          color: ConstantColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Gap(Insets.small),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: ConstantColors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
