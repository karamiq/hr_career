import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientIcon extends StatelessWidget {
  final dynamic icon;
  final double? size;

  const GradientIcon(this.icon, {this.size, super.key});

  @override
  Widget build(BuildContext context) {
    if (icon is IconData) {
      return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) =>
            ConstantColors.primaryGradient().createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Icon(size: size ?? 24, icon),
      );
    }

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          ConstantColors.primaryGradient().createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: SvgPicture.asset(icon, fit: BoxFit.contain, height: size, width: size),
    );
  }
}
