import 'package:app/common_lib.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'extra_colors.dart';
part 'app_theme.g.dart';

class ConstantColors {
  static const primary = Color(0xFFF89C1C);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0x00000000);

  static const red = Color(0xFFB83B40);

  static const yellow = Color(0xFFF3B702);
  static const green = Color(0xFF4CAF50);

  static LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFBBF61), Color(0xFFD88627)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const redVibrant = LinearGradient(
    colors: [Color(0xFFE57373), Color(0xFFEF5350)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const blueVibrant = LinearGradient(
    colors: [Color(0xFF42A5F5), Color(0xFF2196F3)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const greenVibrant = LinearGradient(
    colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const purpleVibrant = LinearGradient(
    colors: [Color(0xFFAB47BC), Color(0xFF8E24AA)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const yellowVibrant = LinearGradient(
    colors: [Color(0xFFFFDC71), Color(0xFFFFAB00)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

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

class AppTheme {
  ThemeData _build(Brightness brightness) {
    final appColors = AppColors(brightness);
    final themeData = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: appColors.background,
      brightness: brightness,
      extensions: [buildExtraColors()],
      inputDecorationTheme: _buildInputDecorationTheme(brightness),
      colorScheme: _buildColorScheme(brightness),
      filledButtonTheme: _buildFilledButtonTheme(brightness),
      outlinedButtonTheme: _buildOutlinedButtonTheme(brightness),
      textButtonTheme: _buildTextButtonTheme(brightness),
      textTheme: _buildTextTheme(),
      fontFamily: GoogleFonts.tajawal().fontFamily,
      fontFamilyFallback: GoogleFonts.tajawal().fontFamilyFallback,
      iconTheme: IconThemeData(color: appColors.text),
      dialogTheme: _buildDialogTheme(brightness),
    );

    return themeData.copyWith(textTheme: _buildTextTheme());
  }

  final borderRadius = BorderRadius.circular(BorderSize.extraSmall);
  final padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 14);

  Brightness getBrightness() {
    return currentBrightness.value;
  }

  final currentBrightness = ValueNotifier<Brightness>(Brightness.light);

  ThemeData buildDarkTheme() {
    currentBrightness.value = Brightness.dark;
    return _build(Brightness.dark);
  }

  ThemeData buildLightTheme() {
    currentBrightness.value = Brightness.light;
    return _build(Brightness.light);
  }

  AppColors getAppColors(Brightness brightness) {
    return AppColors(brightness);
  }

  DialogThemeData _buildDialogTheme(Brightness brightness) {
    final appColors = getAppColors(brightness);
    return DialogThemeData(
      backgroundColor: appColors.foreGround,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Insets.medium)),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    final appColors = getAppColors(brightness);

    OutlineInputBorder buildBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      contentPadding: padding,
      fillColor: colorScheme.onBackground,
      filled: true,

      activeIndicatorBorder: BorderSide.none,
      hintStyle: TextStyle(color: appColors.text, fontSize: 16),
      border: buildBorder(colorScheme.onBackground),
      errorBorder: buildBorder(colorScheme.error, width: 1.5),
      enabledBorder: buildBorder(Colors.transparent),
      focusedBorder: buildBorder(colorScheme.primary),
      focusedErrorBorder: buildBorder(colorScheme.error, width: 2),
      disabledBorder: buildBorder(colorScheme.outline.withOpacity(0.5)),
      iconColor: appColors.text,
    );
  }

  // chagne the text color to black for light theme and white for dark theme
  // and change the background color to white for light theme and black for dark theme
  // and change the foreground color to black for light theme and white for dark theme
  TextTheme _buildTextTheme() {
    return GoogleFonts.tajawalTextTheme().copyWith(
      headlineLarge: GoogleFonts.tajawalTextTheme().headlineLarge?.copyWith(
        fontSize: 32,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      headlineMedium: GoogleFonts.tajawalTextTheme().headlineMedium?.copyWith(
        fontSize: 24,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      headlineSmall: GoogleFonts.tajawalTextTheme().headlineSmall?.copyWith(
        fontSize: 20,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      bodyLarge: GoogleFonts.tajawalTextTheme().bodyLarge?.copyWith(
        fontSize: 18,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      bodyMedium: GoogleFonts.tajawalTextTheme().bodyMedium?.copyWith(
        fontSize: 16,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      bodySmall: GoogleFonts.tajawalTextTheme().bodySmall?.copyWith(
        fontSize: 14,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      titleLarge: GoogleFonts.tajawalTextTheme().titleLarge?.copyWith(
        fontSize: 18,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      titleMedium: GoogleFonts.tajawalTextTheme().titleMedium?.copyWith(
        fontSize: 16,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      titleSmall: GoogleFonts.tajawalTextTheme().titleSmall?.copyWith(
        fontSize: 14,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      labelLarge: GoogleFonts.tajawalTextTheme().labelLarge?.copyWith(
        fontSize: 16,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      labelMedium: GoogleFonts.tajawalTextTheme().labelMedium?.copyWith(
        fontSize: 14,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
      labelSmall: GoogleFonts.tajawalTextTheme().labelSmall?.copyWith(
        fontSize: 12,
        color: currentBrightness.value == Brightness.light
            ? const Color(0xFF000000)
            : const Color(0xFFFFFFFF),
      ),
    );
  }

  ExtraColors buildExtraColors() {
    return const ExtraColors(
      success: Color.fromARGB(255, 28, 101, 30),
      onSuccess: Colors.white,
      error: Color.fromARGB(255, 255, 0, 0),
    );
  }

  ColorScheme _buildColorScheme(Brightness brightness) {
    final appColors = AppColors(brightness);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: appColors.primary,
      primary: appColors.primary,
      secondary: appColors.secondary,
      background: appColors.background,
      onBackground: appColors.foreGround,
      brightness: brightness,
      onPrimary: appColors.text,
      onSecondary: appColors.text,
      onSurface: appColors.text,
      // this is the default color of the container
      surfaceContainerHighest: appColors.foreGround,
      surface: appColors.foreGround,
      onSurfaceVariant: appColors.text,
      outline: appColors.text,
    );
    return colorScheme.copyWith(outline: colorScheme.outline.withOpacity(0.5));
  }

  FilledButtonThemeData _buildFilledButtonTheme(Brightness brightness) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 55),
        maximumSize: const Size(double.infinity, double.infinity),
        // padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme(Brightness brightness) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }

  TextButtonThemeData _buildTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }
}

final colorSchemeNotifier = ValueNotifier<ColorScheme>(
  ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 17, 61, 128),
    brightness: AppTheme().getBrightness(),
  ),
);

Provider<ConstantColors> constantColorsProvider = Provider<ConstantColors>((ref) {
  return ConstantColors();
});

@riverpod
AppColors appColors(Ref ref) {
  final brightness = ref.watch(settingsProvider).themeMode == ThemeMode.light
      ? Brightness.light
      : Brightness.dark;
  return AppColors(brightness);
}
