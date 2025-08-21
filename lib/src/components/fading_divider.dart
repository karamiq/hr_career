import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FadingGardientDivider extends StatelessWidget {
  const FadingGardientDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(gradient: ConstantColors.primaryGradient()),
    );
  }
}
