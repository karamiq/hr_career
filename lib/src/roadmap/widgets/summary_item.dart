import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/constant_colors.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const SummaryItem({required this.icon, required this.value, required this.label, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: ConstantColors.white, size: IconSize.medium),
            Gap(Insets.extraSmall),
            Text(
              value,
              textHeightBehavior: TextHeightBehavior(applyHeightToLastDescent: false),
              style: TextStyle(color: ConstantColors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        SizedBox(height: Insets.extraSmall),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: ConstantColors.white, fontSize: 13, height: 1.2),
        ),
      ],
    );
  }
}
