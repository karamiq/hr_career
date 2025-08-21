import 'package:app/src/skills/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/skill_model.dart';
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
                borderRadius: BorderSize.smallRadius,
              ),
              child: FlexibleSpaceBar(
                title: Padding(
                  padding: Insets.smallAll,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatsCard(
                        value: SkillStats.calculateTotalPoints(softSkills).toString(),
                        label: 'Total Points',
                        icon: Icons.analytics_outlined,
                      ),
                      StatsCard(
                        value: (softSkills.length).toString(),
                        label: 'Skills',
                        icon: Icons.workspace_premium,
                      ),
                      StatsCard(
                        value: SkillStats.formatPercentage(SkillStats.calculateAveragePercentage(softSkills)),
                        label: 'Average',
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
                                  'Senior Level',
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
                        Text(
                          context.l10n.skills,
                          style: TextStyle(
                            color: ConstantColors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Professional Development Overview',
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

  Widget _buildModernSkillSection(BuildContext context, String title, List<Skill> skills, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...skills.asMap().entries.map(
          (entry) => ModernSkillCard(skill: entry.value, gradient: VibrantGradients.getByIndex(entry.key)),
        ),
      ],
    );
  }
}
