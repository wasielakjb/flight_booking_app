import 'package:flutter/material.dart';

extension ThemeModeExtension on BuildContext {
  bool get isLightMode {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.light;
  }

  bool get isDarkMode {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }
}
