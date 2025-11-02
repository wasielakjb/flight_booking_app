import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppThemeCubit extends Cubit<ThemeMode> {
  AppThemeCubit() : super(ThemeMode.system);

  ThemeMode get theme => state;
}
