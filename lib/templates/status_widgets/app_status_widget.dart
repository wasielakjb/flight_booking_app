import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/extensions/theme_mode_extension.dart';
import 'package:flutter/material.dart';

class AppStatusWidget extends StatelessWidget {
  const AppStatusWidget({
    required this.icon,
    this.columnAlignment = MainAxisAlignment.start,
    this.text,
    this.topContent,
    this.content,
    super.key,
  });

  final MainAxisAlignment columnAlignment;
  final IconData icon;
  final String? text;
  final Widget? topContent;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: columnAlignment,
      children: [
        Icon(
          icon,
          size: 28,
          color: context.isDarkMode ? context.surface : context.onSurface,
        ),
        const SizedBox(height: 16),
        if (topContent != null)
          topContent!
        else if (text != null)
          Text(text!, style: context.labelLarge),
        if (content != null) ...[
          const SizedBox(height: 4),
          content!,
        ],
      ],
    );
  }
}
