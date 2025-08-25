import 'package:app/common_lib.dart';
import 'package:app/core/theme/constant_colors.dart';
import 'package:app/src/skills/utils/vibrant_gradients.dart';
import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String skill;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool useVibrantColors;
  final int? gradientIndex;

  const SkillChip({
    super.key,
    required this.skill,
    this.backgroundColor,
    this.borderColor,
    this.useVibrantColors = true,
    this.gradientIndex,
  });

  @override
  Widget build(BuildContext context) {
    LinearGradient? gradient;
    if (useVibrantColors && backgroundColor == null) {
      if (gradientIndex != null) {
        gradient = VibrantGradients.getByIndex(gradientIndex!);
      } else {
        final hash = skill.hashCode.abs();
        gradient = VibrantGradients.getByIndex(hash);
      }
    } else {}
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Insets.small, vertical: Insets.extraSmall),
      decoration: BoxDecoration(gradient: gradient, borderRadius: BorderSize.extraSmallRadius),
      child: Text(
        skill,
        style: TextStyle(color: ConstantColors.white, fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
