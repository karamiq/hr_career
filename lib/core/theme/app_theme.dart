export 'app_colors.dart';
export 'constant_colors.dart';
import 'package:app/common_lib.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'extra_colors.dart';
import 'constant_colors.dart';
import 'app_colors.dart';
part 'app_theme.g.dart';

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
      onSuccess: ConstantColors.white,
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
