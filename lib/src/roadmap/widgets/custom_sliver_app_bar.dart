import 'package:app/src/roadmap/widgets/position_card.dart';
import 'package:app/src/roadmap/widgets/summary_item.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../core/theme/app_theme.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverAppBar(
      expandedHeight: 304,
      floating: true,
      pinned: true,
      elevation: 0,
      toolbarHeight: 120.0,
      actionsPadding: Insets.noneAll,
      titleSpacing: Insets.sm - Insets.extraSmall,
      title: PositionCard(
        icon: Assets.assetsSvgRocket,
        title: context.l10n.targetPosition, // localized
        subtitle: 'Senior Network Engineer', // keep as parameter
        iconColor: colorScheme.onPrimary,
      ),
      // backgroundColor: Colors.transparent,
      backgroundColor: colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderSize.smallRadius),
      excludeHeaderSemantics: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          padding: Insets.smallAll,
          decoration: BoxDecoration(
            gradient: ConstantColors.primaryGradient(),
            borderRadius: BorderSize.smallRadius,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(height: Insets.small),
                    PositionCard(
                      icon: Assets.assetsSvgPerson,
                      title: context.l10n.currentPosition, // localized
                      subtitle: 'Junior Network Engineer', // keep as parameter
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
                      SummaryItem(
                        icon: Icons.badge_outlined,
                        value: '11',
                        label: context.l10n.earnedCertifications,
                      ),
                      Container(width: 1, height: 32, color: colorScheme.onPrimary.withOpacity(0.3)),
                      SummaryItem(
                        icon: Icons.flag_outlined,
                        value: '11',
                        label: context.l10n.totalCertifications,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
