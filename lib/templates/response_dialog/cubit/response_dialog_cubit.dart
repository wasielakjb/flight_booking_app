import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/templates/response_dialog/models/response_dialog_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'response_dialog_state.dart';

@singleton
class ResponseDialogCubit extends Cubit<ResponseDialogState> {
  ResponseDialogCubit() : super(ResponseDialogState.initial());

  void success({required Widget title, Widget? subtitle, IconData? iconData, List<Widget>? content}) {
    emit(
      ResponseDialogState(
        title: title,
        subtitle: subtitle,
        iconData: iconData ?? Icons.verified_rounded,
        type: ResponseDialogTheme.success,
        content: content,
      ),
    );
  }

  void info(Widget title, {Widget? subtitle, IconData? iconData, List<Widget>? content}) {
    emit(
      ResponseDialogState(
        title: title,
        subtitle: subtitle,
        iconData: iconData ?? Icons.info_rounded,
        type: ResponseDialogTheme.info,
        content: content,
      ),
    );
  }

  void warning(Widget title, {Widget? subtitle, IconData? iconData, List<Widget>? content}) {
    emit(
      ResponseDialogState(
        title: title,
        iconData: iconData ?? Icons.warning_rounded,
        type: ResponseDialogTheme.warning,
        content: content,
      ),
    );
  }

  void error({required Widget title, Widget? subtitle, IconData? iconData, List<Widget>? content}) {
    emit(
      ResponseDialogState(
        title: title,
        subtitle: subtitle,
        iconData: iconData ?? Icons.error_rounded,
        type: ResponseDialogTheme.error,
        content: content,
      ),
    );
  }

  void neutral(Widget title, {Widget? subtitle, IconData? iconData, List<Widget>? content}) {
    emit(
      ResponseDialogState(
        title: title,
        subtitle: subtitle,
        iconData: iconData ?? Icons.notifications_rounded,
        type: ResponseDialogTheme.neutral,
        content: content,
      ),
    );
  }
}
