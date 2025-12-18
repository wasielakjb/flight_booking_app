import 'package:flight_booking_app/core/request/form_request.dart';
import 'package:flight_booking_app/extensions/reactive_form_extension.dart';
import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';
import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/features/flights/domain/request/flight_offert_request.dart';
import 'package:flight_booking_app/screens/home/form/form_builders/flight_offert_fg_factory.dart';
import 'package:flight_booking_app/screens/home/form/form_builders/flight_offert_form_keys.dart';
import 'package:flight_booking_app/templates/form/cubit/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightOffertFormKeys;

class FlightOffertFormCubit extends FormCubit {
  FlightOffertFormCubit({required this.repository})
      : super(FormCubitState.initial());

  @protected
  final FlightsRepository repository;

  @override
  FormGroup buildForm() {
    return FlightOffertFormGroupFactory.create;
  }

  @override
  FormRequest mapBeforeSubmit() {
    final passengers = formGroup.controlVal<PassengerCount>(_K.passengers)!;
    return FlightOffertRequest(
      originLocationCode: formGroup
          .controlVal<LocationAirport>(_K.originLocationCode)!
          .iataCode,
      destinationLocationCode: formGroup
          .controlVal<LocationAirport>(_K.destinationLocationCode)!
          .iataCode,
      departureDate: formGroup.controlVal<DateTime>(_K.departureDate)!,
      returnDate: formGroup.controlVal<DateTime>(_K.returnDate),
      adults: passengers.adults,
      children: passengers.children,
      infants: passengers.infants,
      travelClass: formGroup.controlVal<TravelClass>(_K.travelClass)!,
    );
  }

  @override
  Future<void> sendForm(covariant FormRequest request) async {}
}
