import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SettingsNavigationWidget extends StatelessWidget {
  const SettingsNavigationWidget({
    required this.title,
    required this.icon,
    this.showAction = true,
    this.route,
    this.onTap,
    this.padding,
    this.backgroundIconColor,
    this.foregroundIconColor,
    this.backgroundColor,
    this.borderRadius,
    super.key,
  });

  final String title;
  final IconData icon;
  final bool showAction;
  final PageRouteInfo<dynamic>? route;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundIconColor;
  final Color? foregroundIconColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: route != null || onTap != null
            ? () {
                if (route != null) {
                  context.pushRoute(route!);
                } else {
                  onTap!.call();
                }
              }
            : null,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            spacing: 12,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: backgroundColor ?? context.surfaceContainerHighest,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: foregroundIconColor ?? context.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(title, style: context.bodyLarge.copyWith(color: foregroundIconColor)),
              const Spacer(),
              if (showAction) const Icon(Iconsax.arrow_right_3_outline, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
