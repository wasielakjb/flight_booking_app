import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingsProfileHeaderWidget extends StatelessWidget {
  const SettingsProfileHeaderWidget({
    required this.title,
    required this.subtitle,
    required this.isPending,
    this.image,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool isPending;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isPending,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Center(
              child: Skeleton.leaf(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: context.surfaceContainerHighest,
                  child: image == null
                      ? const Icon(Iconsax.image_outline, size: 48)
                      : null,
                ),
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
