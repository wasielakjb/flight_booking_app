import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.title,
    this.subtitle,
    this.actions,
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  static const double buttonSize = 60;
  static const double iconSize = 24;
  static const double margin = 20 - (buttonSize - iconSize) / 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: context.maybePop,
            icon: const Icon(
              Icons.close_rounded,
              size: iconSize,
            ),
          ),
          Padding(
            padding: subtitle != null
                ? const EdgeInsets.symmetric(vertical: 18)
                : EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.titleMedium),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(title, style: context.titleMedium),
                ],
              ],
            ),
          ),
          if (actions != null && actions!.isNotEmpty)
            ...?actions
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}
