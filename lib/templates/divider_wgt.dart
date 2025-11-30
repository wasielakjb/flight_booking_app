import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    required this.label,
    this.padding = EdgeInsets.zero,
    this.indent = 8,
    this.thickness = 1,
    super.key,
  });

  final EdgeInsetsGeometry padding;
  final String label;
  final double indent;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            child: Divider(
              endIndent: indent,
              thickness: thickness,
              color: context.outlineVariant,
            ),
          ),
          Text(
            label,
            style: context.bodySmall.copyWith(
              color: context.onSurface.withValues(alpha: 0.8),
            ),
          ),
          Expanded(
            child: Divider(
              indent: indent,
              thickness: thickness,
              color: context.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
