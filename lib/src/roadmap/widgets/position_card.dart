import 'package:app/core/theme/constant_colors.dart';
import 'package:app/src/components/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:app/core/utils/constants/sizes.dart';

class PositionCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  const PositionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Insets.smallAll,
      decoration: BoxDecoration(
        color: ConstantColors.white.withOpacity(0.25),
        borderRadius: BorderSize.smallRadius,
      ),
      child: ListTile(
        leading: Container(
          padding: Insets.smallAll,
          decoration: BoxDecoration(
            color: ConstantColors.white.withOpacity(.4),
            borderRadius: BorderSize.extraSmallRadius,
          ),
          child: GradientIcon(icon, size: 30),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: ConstantColors.white),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: ConstantColors.white)),
      ),
    );
  }
}
