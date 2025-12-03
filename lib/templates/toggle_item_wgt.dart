import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class ToggleItemWidget extends StatelessWidget {
  const ToggleItemWidget({
    required this.title,
    required this.value,
    this.subtitle,
    this.onChanged,
    super.key,
  });

  final Widget title;
  final Widget? subtitle;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: context.titleMedium,
                  child: title,
                ),
                if (subtitle != null)
                  DefaultTextStyle(
                    style: context.labelLarge.copyWith(color: context.outline),
                    maxLines: 2,
                    child: subtitle!,
                  ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Switch(value: value, onChanged: onChanged),
            ),
          ),
        ],
      ),
    );
  }
}
