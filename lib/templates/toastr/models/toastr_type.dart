import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';

enum ToastrType {
  neutral,
  success,
  info,
  error;

  Color resolveBackground(BuildContext context) {
    return switch (this) {
      neutral => context.inverseSurface,
      success => context.successContainer,
      info => context.infoContainer,
      error => context.errorContainer,
    };
  }

  Color resolveForeground(BuildContext context) {
    return switch (this) {
      neutral => context.onInverseSurface,
      success => context.onSuccessContainer,
      info => context.onInfoContainer,
      error => context.error,
    };
  }
}
