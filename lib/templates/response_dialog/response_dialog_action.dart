import 'package:flight_booking_app/templates/response_dialog/models/response_dialog_theme.dart';
import 'package:flutter/material.dart';

class ResponseDialogAction extends StatelessWidget {
  const ResponseDialogAction({
    required this.action,
    required this.text,
    required this.type,
    this.primary = true,
    super.key,
  });

  final VoidCallback action;
  final String text;
  final ResponseDialogTheme type;
  final bool primary;

  Widget buttonContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (primary) {
      return FilledButton(
        style: type.resolveFilledButtonStyle(context),
        onPressed: action,
        child: buttonContent(),
      );
    }
    return FilledButton.tonal(
      style: type.resolveTonalButtonStyle(context),
      onPressed: action,
      child: buttonContent(),
    );
  }
}
