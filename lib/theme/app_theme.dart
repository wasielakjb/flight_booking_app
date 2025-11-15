import 'package:flight_booking_app/theme/app_color_scheme.dart';
import 'package:flight_booking_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: lightColorScheme.outlineVariant),
      ),
      hintStyle: lightTextTheme.bodyLarge?.copyWith(
        color: lightColorScheme.onSurface.withValues(alpha: 0.4),
      ),
      labelStyle: lightTextTheme.bodyLarge,
      contentPadding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 13),
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(0),
      side: WidgetStatePropertyAll(
        BorderSide(color: lightColorScheme.outlineVariant),
      ),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      hintStyle: WidgetStatePropertyAll(
        lightTextTheme.bodyLarge?.copyWith(
          color: lightColorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: darkColorScheme,
    textTheme: darkTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: darkColorScheme.outlineVariant),
      ),
      hintStyle: darkTextTheme.bodyLarge?.copyWith(
        color: darkColorScheme.onSurface.withValues(alpha: 0.4),
      ),
      labelStyle: darkTextTheme.bodyLarge,
      contentPadding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 13),
    ),
  );
}
