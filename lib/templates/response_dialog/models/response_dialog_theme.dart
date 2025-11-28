import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';

enum ResponseDialogTheme {
  success,
  info,
  warning,
  error,
  neutral;

  Color resolveBackground(BuildContext context) {
    return switch (this) {
      success => context.successContainer,
      info => context.tertiaryContainer,
      warning => context.warningContainer,
      error => context.errorContainer,
      neutral => context.surfaceContainer,
    };
  }

  Color resolveForeground(BuildContext context) {
    return switch (this) {
      success => context.onSuccessContainer,
      info => context.onInfoContainer,
      warning => context.onWarningContainer,
      error => context.onErrorContainer,
      neutral => context.onSurfaceVariant,
    };
  }

  ButtonStyle resolveFilledButtonStyle(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: switch (this) {
        success || neutral => context.primary,
        info => context.tertiary,
        warning => context.warning,
        error => context.error,
      },
      foregroundColor: switch (this) {
        success || neutral => context.onPrimary,
        info => context.onTertiary,
        warning => context.onWarning,
        error => context.onError,
      },
    );
  }

  ButtonStyle resolveTonalButtonStyle(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: switch (this) {
        success || neutral => context.primaryContainer,
        info => context.tertiaryContainer,
        warning => context.warningContainer,
        error => context.errorContainer,
      },
      foregroundColor: switch (this) {
        success || neutral => context.onPrimaryContainer,
        info => context.onTertiaryContainer,
        warning => context.onWarningContainer,
        error => context.onErrorContainer,
      },
    );
  }
}
