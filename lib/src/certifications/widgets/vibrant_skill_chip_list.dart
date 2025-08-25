import 'package:app/common_lib.dart';
import 'package:app/src/certifications/widgets/skill_chip.dart';
import 'package:flutter/material.dart';

class VibrantSkillChipList extends StatelessWidget {
  final List<String> skills;
  final double spacing;
  final double runSpacing;
  final bool forceVibrant;

  const VibrantSkillChipList({
    super.key,
    required this.skills,
    this.spacing = Insets.small,
    this.runSpacing = Insets.small,
    this.forceVibrant = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: skills.asMap().entries.map((entry) {
        final index = entry.key;
        final skill = entry.value;

        return SkillChip(skill: skill, useVibrantColors: forceVibrant, gradientIndex: index);
      }).toList(),
    );
  }
}
