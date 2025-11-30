import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/toastr/models/toastr_type.dart';
import 'package:flutter/material.dart';

class AppToastr {
  static void neutral(BuildContext context, String message,{String? title, SnackBarAction? action}) {
    show(context, message, type: ToastrType.neutral, title: title, action: action);
  }

  static void success(BuildContext context, String message, {String? title, SnackBarAction? action}) {
    show(context, message,type: ToastrType.success, title: title, action: action);
  }

  static void info(BuildContext context, String message, {String? title, SnackBarAction? action}) {
    show(context, message, type: ToastrType.info, title: title, action: action);
  }

  static void error(BuildContext context, String message, {String? title, SnackBarAction? action}) {
    show(context, message, type: ToastrType.error, title: title, action: action);
  }

  static void show(BuildContext context, String message, {required ToastrType type, String? title, SnackBarAction? action}) {
    late final SnackBar snackBar;
    if (title != null) {
      snackBar = SnackBar(
        backgroundColor: type.resolveBackground(context),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.bodyMediumBold.copyWith(
                color: type.resolveForeground(context),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              message,
              style: context.bodyMedium.copyWith(
                color: type.resolveForeground(context),
              ),
            ),
          ],
        ),
        action: action,
      );
    } else {
      snackBar = SnackBar(
        backgroundColor: type.resolveBackground(context),
        content: Text(
          message,
          style: context.bodyMediumBold.copyWith(
            color: type.resolveForeground(context),
          ),
        ),
        action: action,
      );
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
