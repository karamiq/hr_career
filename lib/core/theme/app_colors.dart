import 'package:flutter/material.dart';
import 'constant_colors.dart';

class AppColors {
  Brightness brightness = Brightness.light; // Default brightness, can be changed later
  late final Color secondary;
  late final Color text;
  late final Color background;
  late final Color foreGround;
  final ConstantColors constantColors = ConstantColors();

  AppColors(this.brightness) {
    final isLight = brightness == Brightness.light;
    if (isLight) {
      secondary = const Color(0xFF4E4E4E);
      text = Color(0xFF000000);
      background = Color(0xFFEFEFEF);
      foreGround = Color(0xFFFFFFFF);
    } else {
      secondary = const Color(0xFFD9D9D9);
      text = Color(0xFFFFFFFF);
      background = Color(0xFF676767);
      foreGround = Color(0xFF4D4D4D);
    }
  }

  final Color primary = ConstantColors.primary;
}
