import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class AnyButtonContent extends StatelessWidget {
  const AnyButtonContent.custom({
    this.text,
    this.pending = false,
    this.fullWidth = false,
    this.icon,
    this.iconRight = false,
    super.key,
  });

  const AnyButtonContent.elevated({
    this.text,
    this.pending = false,
    this.fullWidth = false,
    this.icon,
    this.iconRight = false,
    super.key,
  });

  const AnyButtonContent.filled({
    this.text,
    this.pending = false,
    this.fullWidth = false,
    this.icon,
    this.iconRight = false,
    super.key,
  });

  const AnyButtonContent.filledTonal({
    this.text,
    this.pending = false,
    this.fullWidth = false,
    this.icon,
    this.iconRight = false,
    super.key,
  });

  const AnyButtonContent.outlinedOrText({
    this.text,
    this.pending = false,
    this.fullWidth = false,
    this.icon,
    this.iconRight = false,
    super.key,
  });

  final String? text;
  final bool pending;
  final bool fullWidth;
  final Widget? icon;
  final bool iconRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: pending ? 0 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (icon != null && !iconRight) ...[
                icon!,
                const SizedBox(width: 10),
              ],
              if (text != null)
                Text(
                  text!,
                  style: context.titleMedium.copyWith(color: context.surface),
                ),
              if (icon != null && iconRight) ...[
                const SizedBox(width: 6),
                icon!,
              ],
            ],
          ),
        ),
        if (pending)
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: context.surface,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
