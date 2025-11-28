import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class ResponseDialogActionDivider extends StatelessWidget {
  const ResponseDialogActionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            child: Divider(
              indent: 16,
              thickness: 2,
              color: context.surfaceContainerHighest,
            ),
          ),
          Text('or', style: context.labelLarge),
          Expanded(
            child: Divider(
              endIndent: 16,
              thickness: 2,
              color: context.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }
}
