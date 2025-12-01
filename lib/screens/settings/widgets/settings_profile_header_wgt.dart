import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingsProfileHeaderWidget extends StatelessWidget {
  const SettingsProfileHeaderWidget({
    required this.title,
    required this.subtitle,
    required this.letter,
    required this.isLoading,
    super.key,
  });

  final String title;
  final String subtitle;
  final String letter;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: context.surfaceContainerHighest,
                child: Text(letter, style: context.displayLarge),
              ),
            ),
            const SizedBox(height: 24),
            Text(title, style: context.displaySmall),
            const SizedBox(height: 4),
            Text(subtitle, style: context.bodyLarge),
          ],
        ),
      ),
    );
  }
}
