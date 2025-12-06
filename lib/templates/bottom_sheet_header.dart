import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.title,
    this.subtitle,
    this.actions,
    this.padding,
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: context.surfaceContainerHighest,
              foregroundColor: context.onSurface,
              iconSize: 20,
            ),
            onPressed: context.maybePop,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }
}
