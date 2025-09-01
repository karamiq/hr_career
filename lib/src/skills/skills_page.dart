import 'package:app/src/skills/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';
import '../../core/theme/app_theme.dart';
import 'widgets/modern_skill_card.dart';
import 'data/skills_data.dart';
import 'utils/skill_stats.dart';
import 'utils/vibrant_gradients.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            toolbarHeight: 120,
            floating: false,
            pinned: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderSize.smallRadius),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: ConstantColors.primaryGradient(),
                borderRadius: BorderSize.largeRadius,
              ),
              child: FlexibleSpaceBar(
                title: Padding(
                  padding: Insets.smallAll,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatsCard(
                        value: SkillStats.calculateTotalPoints(softSkills).toString(),
                        label: context.l10n.totalPoints,
                        icon: Icons.analytics_outlined,
                      ),
                      StatsCard(
                        value: (softSkills.length).toString(),
                        label: context.l10n.skills,
                        icon: Icons.workspace_premium,
                      ),
                      StatsCard(
                        value: SkillStats.formatPercentage(SkillStats.calculateAveragePercentage(softSkills)),
                        label: context.l10n.average,
                        icon: Icons.show_chart,
                      ),
                    ],
                  ),
                ),
                background: SafeArea(
                  child: Padding(
                    padding: Insets.largeAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: ConstantColors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: ConstantColors.white.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.trending_up, color: ConstantColors.white, size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  context.l10n.seniorLevel,
                                  style: TextStyle(
                                    color: ConstantColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              Assets.assetsSvgSkill,
                              color: ConstantColors.white,
                              height: 40,
                              width: 40,
                            ),
                            const Gap(Insets.extraSmall),
                            Text(
                              context.l10n.skills,
                              style: TextStyle(
                                color: ConstantColors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.l10n.professionalDevelopmentOverview,
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
          ),

          // Skills Content
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: Insets.smallAll,
                child: ModernSkillCard(
                  skill: softSkills[index],
                  gradient: VibrantGradients.getByIndex(index),
                ),
              ),
              childCount: softSkills.length,
            ),
          ),

          SliverGap(navBarHeight * 1.25),
        ],
      ),
    );
  }
}
