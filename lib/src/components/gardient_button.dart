import 'package:app/core/theme/theme_lib.dart';
import 'package:app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Gradient? gradient;

  const GradientButton({super.key, this.onPressed, required this.text, this.gradient});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient ?? ConstantColors.primaryGradient,
        borderRadius: BorderSize.extraSmallRadius,
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: ConstantColors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
