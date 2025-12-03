import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Icon(
          Iconsax.airplane_square_bold,
          color: context.primary,
          size: 80,
        ),
        Text(
          'F L I G H T  B O O K I N G',
          style: context.headlineLarge.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
