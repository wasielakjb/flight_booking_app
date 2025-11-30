import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/templates/toastr/models/toastr_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'toastr_state.dart';

@singleton
class ToastrCubit extends Cubit<ToastrState> {
  ToastrCubit() : super(ToastrState.initial());

  void neutral(String message, {String? title, SnackBarAction? action}) => emit(
        state.copyWith(
          type: ToastrType.neutral,
          title: title,
          message: message,
          action: action,
        ),
      );

  void info(String message, {String? title, SnackBarAction? action}) => emit(
        state.copyWith(
          type: ToastrType.info,
          title: title,
          message: message,
          action: action,
        ),
      );

  void success(String message, {String? title, SnackBarAction? action}) => emit(
        state.copyWith(
          type: ToastrType.success,
          title: title,
          message: message,
          action: action,
        ),
      );

  void error(String message, {String? title, SnackBarAction? action}) => emit(
        state.copyWith(
          type: ToastrType.error,
          title: title,
          message: message,
          action: action,
        ),
      );
}
