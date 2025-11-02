import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppLocaleCubit extends Cubit<Locale> {
  AppLocaleCubit() : super(const Locale('en'));

  Locale get locale => state;
}
