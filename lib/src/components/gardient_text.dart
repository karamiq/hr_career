import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final TextStyle? style;

  const GradientText(this.text, {super.key, this.gradient, this.style});

  @override
  Widget build(BuildContext context) {
    final Gradient effectiveGradient = gradient ?? ConstantColors.primaryGradient;

    return ShaderMask(
      shaderCallback: (bounds) {
        return effectiveGradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(text, style: style?.copyWith(color: Colors.white)),
    );
  }
}
