import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SelectorItemWidget extends StatelessWidget {
  const SelectorItemWidget({
    required this.title,
    required this.onTap,
    required this.active,
    super.key,
  });

  final String title;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.titleSmall),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                active ? Iconsax.tick_circle_bold : null,
                size: 24,
                color: context.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
