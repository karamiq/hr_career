import 'package:app/common_lib.dart';
import 'package:app/src/roadmap/widgets/position_card.dart';
import 'package:app/src/roadmap/widgets/summary_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class RoadMApAppBar extends StatelessWidget {
  const RoadMApAppBar({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Insets.smallAll,
      decoration: BoxDecoration(
        gradient: ConstantColors.primaryGradient(),
        borderRadius: BorderSize.smallRadius,
        border: Border.all(color: colorScheme.onBackground, width: 4),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: Insets.small),
                PositionCard(
                  icon: Assets.assetsSvgRocket,
                  title: 'Target position',
                  subtitle: 'Senior Network Engineer',
                  iconColor: colorScheme.onPrimary,
                ),
              ],
            ),
            SizedBox(height: Insets.small),
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ConstantColors.white.withOpacity(0.4),
                borderRadius: BorderSize.extraSmallRadius,
              ),
            ),
            SizedBox(height: Insets.small),
            Container(
              padding: Insets.smallAll,
              decoration: BoxDecoration(
                color: ConstantColors.white.withOpacity(0.25),
                borderRadius: BorderSize.smallRadius,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SummaryItem(icon: Icons.badge_outlined, value: '11', label: 'Earned\nCertifications'),
                  Container(width: 1, height: 32, color: colorScheme.onPrimary.withOpacity(0.3)),
                  SummaryItem(icon: Icons.flag_outlined, value: '11', label: 'Total\nCertifications'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
