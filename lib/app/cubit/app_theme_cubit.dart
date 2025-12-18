import 'package:flight_booking_app/core/models/json.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppThemeCubit extends HydratedCubit<ThemeMode> {
  AppThemeCubit() : super(ThemeMode.system);

  ThemeMode get theme => state;

  void updateTheme(ThemeMode theme) {
    emit(theme);
  }
  
  @override
  ThemeMode? fromJson(Json json) {
    return json['theme'] != null
        ? ThemeMode.values[json['theme'] as int]
        : null;
  }
  
  @override
  Json? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}
