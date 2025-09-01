import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/constant_colors.dart';
import 'package:app/data/models/skill_model.dart';
import 'package:flutter/material.dart';

class ModernSkillCard extends StatelessWidget {
  final Skill skill;
  final LinearGradient gradient;

  const ModernSkillCard({super.key, required this.skill, required this.gradient});

  String levelName(BuildContext context) {
    if (skill.points >= 30) {
      return context.l10n.expert;
    } else if (skill.points >= 20) {
      return context.l10n.advanced;
    } else if (skill.points >= 10) {
      return context.l10n.intermediate;
    } else {
      return context.l10n.beginner;
    }
  }

  double progress() {
    if (skill.points >= 30) {
      return 100.0;
    } else if (skill.points >= 20) {
      return 75.0;
    } else if (skill.points >= 10) {
      return 50.0;
    } else {
      return 25.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final progressPercentage = progress();

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(24)),
        padding: Insets.mediumAll,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ConstantColors.white.withOpacity(0.2),
                border: Border.all(color: ConstantColors.white.withOpacity(0.3), width: 2),
              ),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                clipBehavior: Clip.antiAlias,
                children: [
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: 100,
                        strokeWidth: 4,
                        backgroundColor: ConstantColors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(ConstantColors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      skill.points.toString(),
                      textHeightBehavior: TextHeightBehavior(applyHeightToLastDescent: false),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          skill.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ConstantColors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ConstantColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ConstantColors.white.withOpacity(0.3)),
                        ),
                        child: Text(
                          levelName(context),
                          style: const TextStyle(
                            color: ConstantColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Insets.small),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(progressPercentage).toInt()}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: ConstantColors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Insets.extraSmall),
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: ConstantColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progressPercentage / 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ConstantColors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: ConstantColors.white.withOpacity(0.3),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
