import 'package:flight_booking_app/core/models/json.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppLocaleCubit extends HydratedCubit<Locale> {
  AppLocaleCubit() : super(const Locale('en'));

  Locale get locale => state;

  void updateLocale(Locale locale) {
    assert(
      ['pl', 'en'].contains(locale.languageCode),
      'App supports only pl, en locale.',
    );
    emit(locale);
  }
  
  @override
  Locale? fromJson(Json json) {
    return json['countryCode'] != null
        ? Locale(json['countryCode'] as String)
        : null;
  }
  
  @override
  Json? toJson(Locale state) {
    return {'countryCode': state.countryCode};
  }
}
