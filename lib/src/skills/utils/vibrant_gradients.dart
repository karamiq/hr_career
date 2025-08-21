import 'dart:math';
import 'package:flutter/material.dart';

class VibrantGradients {
  static final Random _random = Random();

  // Predefined gradient color combinations similar to ConstantColors
  static final List<List<Color>> _gradientCombinations = [
    // Red vibrant
    [Color(0xFFFF7373), Color(0xFFEF5350)],
    // Blue vibrant
    [Color(0xFF42A5F5), Color(0xFF2196F3)],
    // Green vibrant
    [Color(0xFF80E27E), Color(0xFF4CAF50)],
    // Purple vibrant
    [Color(0xFFAB47BC), Color(0xFF8E24AA)],
    // Yellow vibrant
    [Color(0xFFFFDC71), Color(0xFFFFAB00)],
    // Orange vibrant
    [Color(0xFFFF9800), Color(0xFFE65100)],
    // Teal vibrant
    [Color(0xFF4DB6AC), Color(0xFF00695C)],
    // Pink vibrant
    [Color(0xFFE91E63), Color(0xFFC2185B)],
    // Indigo vibrant
    [Color(0xFF5C6BC0), Color(0xFF3F51B5)],
    // Cyan vibrant
    [Color(0xFF26C6DA), Color(0xFF00ACC1)],
    // Lime vibrant
    [Color(0xFFCDDC39), Color(0xFF8BC34A)],
    // Deep Orange vibrant
    [Color(0xFFFF5722), Color(0xFFD84315)],
  ];

  /// Generates a completely random vibrant gradient
  static LinearGradient randomVibrant({
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    final colors = _gradientCombinations[_random.nextInt(_gradientCombinations.length)];
    return LinearGradient(begin: begin, end: end, colors: colors);
  }

  /// Generates a random vibrant gradient with 3 colors
  static LinearGradient randomVibrantTriple({
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    final colors = _gradientCombinations[_random.nextInt(_gradientCombinations.length)];
    // Create a 3-color gradient by adding a middle color
    final middleColor = Color.lerp(colors[0], colors[1], 0.5)!;

    return LinearGradient(
      begin: begin,
      end: end,
      colors: [colors[0], middleColor, colors[1]],
      stops: const [0.0, 0.5, 1.0],
    );
  }

  /// Generates a random radial gradient
  static RadialGradient randomVibrantRadial({
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
  }) {
    final colors = _gradientCombinations[_random.nextInt(_gradientCombinations.length)];

    return RadialGradient(center: center, radius: radius, colors: colors);
  }

  /// Generates a single vibrant color with high saturation and brightness
  static Color _generateVibrantColor() {
    // Generate HSL values for vibrant colors
    final hue = _random.nextDouble() * 360; // Full hue range
    final saturation = 0.7 + _random.nextDouble() * 0.3; // 70-100% saturation
    final lightness = 0.4 + _random.nextDouble() * 0.3; // 40-70% lightness

    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }

  /// Generates a gradient with complementary colors
  static LinearGradient randomComplementary({
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    // Pick two different gradient combinations
    final index1 = _random.nextInt(_gradientCombinations.length);
    int index2 = _random.nextInt(_gradientCombinations.length);
    while (index2 == index1) {
      index2 = _random.nextInt(_gradientCombinations.length);
    }

    final colors = [_gradientCombinations[index1][0], _gradientCombinations[index2][1]];

    return LinearGradient(begin: begin, end: end, colors: colors);
  }

  /// Generates a gradient with analogous colors (similar color families)
  static LinearGradient randomAnalogous({
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    // Group similar colors together
    final warmColors = [0, 4, 5, 11]; // Red, Yellow, Orange, Deep Orange
    final coolColors = [1, 2, 6, 8, 9]; // Blue, Green, Teal, Indigo, Cyan
    final purpleColors = [3, 7]; // Purple, Pink

    final colorGroups = [warmColors, coolColors, purpleColors];
    final selectedGroup = colorGroups[_random.nextInt(colorGroups.length)];

    final colors = _gradientCombinations[selectedGroup[_random.nextInt(selectedGroup.length)]];
    return LinearGradient(begin: begin, end: end, colors: colors);
  }

  /// Generates a warm-toned random gradient
  static LinearGradient randomWarm({
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    // Warm color indices: Red, Yellow, Orange, Deep Orange
    final warmIndices = [0, 4, 5, 11];
    final colors = _gradientCombinations[warmIndices[_random.nextInt(warmIndices.length)]];
    return LinearGradient(begin: begin, end: end, colors: colors);
  }

  /// Generates a cool-toned random gradient
  static LinearGradient randomCool({
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    // Cool color indices: Blue, Green, Teal, Indigo, Cyan
    final coolIndices = [1, 2, 6, 8, 9];
    final colors = _gradientCombinations[coolIndices[_random.nextInt(coolIndices.length)]];
    return LinearGradient(begin: begin, end: end, colors: colors);
  }

  /// Get a specific gradient by index (for consistent colors)
  static LinearGradient getByIndex(int index) {
    final colors = _gradientCombinations[index % _gradientCombinations.length];
    return LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors);
  }

  /// Get all available gradients
  static List<LinearGradient> get allGradients {
    return _gradientCombinations
        .map((colors) => LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors))
        .toList();
  }
}
