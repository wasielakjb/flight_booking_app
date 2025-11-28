import 'package:flutter/material.dart';

@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  const AppCustomColors({
    this.success,
    this.onSuccess,
    this.successContainer,
    this.onSuccessContainer,
    this.info,
    this.onInfo,
    this.infoContainer,
    this.onInfoContainer,
    this.warning,
    this.onWarning,
    this.warningContainer,
    this.onWarningContainer,
  });

  final Color? success;
  final Color? onSuccess;
  final Color? successContainer;
  final Color? onSuccessContainer;

  final Color? info;
  final Color? onInfo;
  final Color? infoContainer;
  final Color? onInfoContainer;

  final Color? warning;
  final Color? onWarning;
  final Color? warningContainer;
  final Color? onWarningContainer;

  static AppCustomColors light = const AppCustomColors(
    success: Color(0xFF336940),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFB5F1BC),
    onSuccessContainer: Color(0xFF00210B),
    info: Color(0xFF39656D),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFFBDEAF4),
    onInfoContainer: Color(0xFF001F25),
    warning: Color(0xFF795900),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFFFDFA0),
    onWarningContainer: Color(0xFF261A00),
  );

  static AppCustomColors dark = const AppCustomColors(
    success: Color(0xFF9AD4A2),
    onSuccess: Color(0xFF003917),
    successContainer: Color(0xFF19512A),
    onSuccessContainer: Color(0xFFB5F1BC),
    info: Color(0xFFA1CED8),
    onInfo: Color(0xFF00363E),
    infoContainer: Color(0xFF204D55),
    onInfoContainer: Color(0xFFBDEAF4),
    warning: Color(0xFFFBBC00),
    onWarning: Color(0xFF402D00),
    warningContainer: Color(0xFF5C4300),
    onWarningContainer: Color(0xFFFFDFA0),
  );

  @override
  AppCustomColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
  }) {
    return AppCustomColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;

    return AppCustomColors(
      success: Color.lerp(success, other.success, t),
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t),
      successContainer: Color.lerp(successContainer, other.successContainer, t),
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t),
      info: Color.lerp(info, other.info, t),
      onInfo: Color.lerp(onInfo, other.onInfo, t),
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t),
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t),
      warning: Color.lerp(warning, other.warning, t),
      onWarning: Color.lerp(onWarning, other.onWarning, t),
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t),
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t),
    );
  }
}
