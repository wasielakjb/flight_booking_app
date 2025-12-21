import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/error/form_error.dart';
import 'package:flight_booking_app/core/mixin/destroy_ref_mixin.dart';
import 'package:flight_booking_app/core/mixin/safe_emit_mixin.dart';
import 'package:flight_booking_app/core/models/nullable_copy.dart';
import 'package:flight_booking_app/core/models/result_short.dart';
import 'package:flight_booking_app/core/models/view_state.dart';
import 'package:flight_booking_app/extensions/future_to_result_extension.dart';
import 'package:flight_booking_app/extensions/reactive_form_extension.dart';
import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/flight_offer.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';
import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/features/flights/domain/request/flight_offert_request.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/form_builders/flights_fg_factory.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/form_builders/flights_form_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'flights_form_state.dart';

typedef _K = FlightsFormKeys;

class FlightsFormCubit extends Cubit<FlightsFormState>
    with BlocDestroyRef, SafeEmit {
  FlightsFormCubit({
    required this.repository,
  }) : super(const FlightsFormState()) {
    init();
  }

  @protected
  final FlightsRepository repository;
  FormGroup? _formGroup;

  FormGroup get formGroup => _formGroup ?? FormGroup({});

  Future<void> init() async {
    _formGroup = FlightsFormGroupFactory.create();
    assert(_formGroup != null, 'Form has not been initialized!');
    emit(state.copyWith(initialized: true));
  }

  FlightOffertRequest mapBeforeSubmit() {
    final passengers = formGroup.controlVal<PassengerCount>(_K.passengers)!;
    return FlightOffertRequest(
      originLocationCode: formGroup.controlVal<Location>(_K.origin)!.iataCode,
      destinationLocationCode: formGroup.controlVal<Location>(_K.destination)!.iataCode,
      departureDate: formGroup.controlVal<DateTime>(_K.departureDate)!,
      adults: passengers.adults,
      children: passengers.children,
      infants: passengers.infants,
      travelClass: formGroup.controlVal<TravelClass>(_K.travelClass)!,
    );
  }

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;

    emit(state.copyWith(pending: true, result: () => null));
    try {
      final request = mapBeforeSubmit();
      final response = await repository.searchFlightOffers(request).asResult();

      if (response.isSuccess) {
        formGroup
          ..markAsPristine()
          ..markAsUntouched();
      }
      emitSafely(state.copyWith(pending: false, result: () => response));
    } catch (err) {
      if (err is TypeError && !kDebugMode) {
        final result = ResultError<List<FlightOffer>>(FormIncorrectRequestMapping());
        emit(state.copyWith(pending: false, result: () => result));
        return;
      }
      rethrow;
    }
  }
}
