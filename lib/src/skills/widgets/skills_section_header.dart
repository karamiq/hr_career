import 'package:flutter/material.dart';
import '../../../core/theme/constant_colors.dart';

class SkillsSectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SkillsSectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: ConstantColors.primaryGradient(),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: colorScheme.primary.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ConstantColors.white, size: 24),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ConstantColors.white),
          ),
        ],
      ),
    );
  }
}
