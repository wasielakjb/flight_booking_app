import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/response_dialog/models/response_dialog_theme.dart';
import 'package:flight_booking_app/templates/response_dialog/response_dialog_icon.dart';
import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  const ResponseDialog({
    required this.title,
    required this.iconData,
    required this.type,
    this.content,
    super.key,
  });

  final Widget title;
  final IconData iconData;
  final ResponseDialogTheme type;
  final List<Widget>? content;

  static Future<void> show({
    required BuildContext context,
    required Widget title,
    required IconData iconData,
    required ResponseDialogTheme type,
    required List<Widget>? content,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (context) => ResponseDialog(
        title: title,
        iconData: iconData,
        type: type,
        content: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponseDialogIcon(
              iconData: iconData,
              type: ResponseDialogTheme.success,
            ),
            const SizedBox(height: 16),
            DefaultTextStyle(
              style: context.titleLarge,
              textAlign: TextAlign.center,
              child: title,
            ),
            const SizedBox(height: 12),
            Column(children: content ?? []),
          ],
        ),
      ),
    );
  }
}
