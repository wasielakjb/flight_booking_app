import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/status_widgets/app_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({
    this.icon,
    this.text,
    this.description,
    super.key,
  });

  final IconData? icon;
  final String? text;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return AppStatusWidget(
      icon: icon ?? Iconsax.folder_outline,
      text: text ?? 'No results',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          description ?? "We have loaded a list, but it's empty.",
          style: context.labelMedium.copyWith(fontWeight: FontWeight.w200),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
