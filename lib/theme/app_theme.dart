import 'package:flight_booking_app/theme/app_color_scheme.dart';
import 'package:flight_booking_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: darkColorScheme,
    textTheme: lightTextTheme,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: lightColorScheme,
    textTheme: darkTextTheme,
  );
}
