import 'package:flight_booking_app/theme/app_color_scheme.dart';
import 'package:flight_booking_app/theme/app_custom_colors.dart';
import 'package:flight_booking_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    typography: Typography.material2021(),
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith((_) {
        return lightTextTheme.labelMedium
            ?.copyWith(fontWeight: FontWeight.w600);
      }),
      backgroundColor: lightColorScheme.surface,
      indicatorColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: lightColorScheme.outlineVariant),
      ),
      hintStyle: lightTextTheme.bodyLarge?.copyWith(
        color: lightColorScheme.onSurface.withValues(alpha: 0.4),
      ),
      labelStyle: lightTextTheme.bodyLarge,
      contentPadding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 14),
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
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(lightTextTheme.labelLarge),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(150, 48)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(lightTextTheme.labelLarge),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: lightColorScheme.outlineVariant),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(150, 48)),
        foregroundColor: WidgetStatePropertyAll(lightColorScheme.onSurface),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    extensions: [
      AppCustomColors.light,
      lightSkeletonizerConfig,
    ],
  );

  static SkeletonizerConfigData lightSkeletonizerConfig = SkeletonizerConfigData(
    effect: ShimmerEffect(
      baseColor: lightColorScheme.surfaceContainerHigh,
      highlightColor: lightColorScheme.surfaceContainerHighest,
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: darkColorScheme.outlineVariant),
      ),
      hintStyle: darkTextTheme.bodyLarge?.copyWith(
        color: darkColorScheme.onSurface.withValues(alpha: 0.4),
      ),
      labelStyle: darkTextTheme.bodyLarge,
      contentPadding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 14),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(darkTextTheme.labelLarge),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(150, 48)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(darkTextTheme.labelLarge),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(150, 48)),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    extensions: [
      AppCustomColors.dark,
      darkSkeletonizerConfig,
    ],
  );

  static SkeletonizerConfigData darkSkeletonizerConfig = SkeletonizerConfigData(
    effect: ShimmerEffect(
      baseColor: darkColorScheme.surfaceContainerHigh,
      highlightColor: darkColorScheme.surfaceContainerHighest,
    ),
  );
}
