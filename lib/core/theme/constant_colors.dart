import 'package:flutter/material.dart';

/// Gradient direction options
enum GradientDirection { horizontal, vertical }

class ConstantColors {
  static const primary = Color(0xFFF89C1C);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0x00000000);

  static const red = Color(0xFFB83B40);

  static const yellow = Color(0xFFF3B702);
  static const green = Color(0xFF4CCF50);

  static const blue = Color(0xFF1C9CF8);

  static const GradientDirection horizontal = GradientDirection.horizontal;
  static const GradientDirection vertical = GradientDirection.vertical;

  static Alignment _getBegin(GradientDirection direction) {
    switch (direction) {
      case GradientDirection.vertical:
        return Alignment.topCenter;
      case GradientDirection.horizontal:
        return Alignment.centerLeft;
    }
  }

  static Alignment _getEnd(GradientDirection direction) {
    switch (direction) {
      case GradientDirection.vertical:
        return Alignment.bottomCenter;
      case GradientDirection.horizontal:
        return Alignment.centerRight;
    }
  }

  static LinearGradient primaryGradient({GradientDirection direction = GradientDirection.horizontal}) =>
      LinearGradient(
        colors: [Color(0xFFFBBF61), primary, Color(0xFFE87C00).withOpacity(0.8)],
        begin: _getBegin(direction),
        end: _getEnd(direction),
      );

  // static LinearGradient blueVibrant({GradientDirection direction = GradientDirection.horizontal}) =>
  //     LinearGradient(
  //       colors: [Color(0xFF61BFFF), blue, Color(0xCC0057E8)],
  //       begin: _getBegin(direction),
  //       end: _getEnd(direction),
  //     );

  static LinearGradient redVibrant({GradientDirection direction = GradientDirection.horizontal}) =>
      LinearGradient(
        colors: [Color(0xFFFF7373), Color(0xFFEF5350)],
        begin: _getBegin(direction),
        end: _getEnd(direction),
      );
  static LinearGradient blueVibrant({GradientDirection direction = GradientDirection.horizontal}) =>
      LinearGradient(
        colors: [Color(0xFF42A5F5), Color(0xFF2196F3)],
        begin: _getBegin(direction),
        end: _getEnd(direction),
      );
  static LinearGradient greenVibrant({GradientDirection direction = GradientDirection.horizontal}) =>
      LinearGradient(
        colors: [Color(0xFF80E27E), Color(0xFF70D270), green, Color(0xFF00C853)],
        begin: _getBegin(direction),
        end: _getEnd(direction),
      );
  static LinearGradient purpleVibrant({GradientDirection direction = GradientDirection.horizontal}) =>
      LinearGradient(
        colors: [Color(0xFFAB47BC), Color(0xFF8E24AA)],
        begin: _getBegin(direction),
        end: _getEnd(direction),
      );
  static LinearGradient yellowVibrant({GradientDirection direction = GradientDirection.horizontal}) =>
      LinearGradient(
        colors: [Color(0xFFFFDC71), Color(0xFFFFAB00)],
        begin: _getBegin(direction),
        end: _getEnd(direction),
      );
}
