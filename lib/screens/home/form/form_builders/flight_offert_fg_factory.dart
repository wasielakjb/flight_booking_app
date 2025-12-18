import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';
import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/screens/home/form/form_builders/flight_offert_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightOffertFormKeys;

class FlightOffertFormGroupFactory {
  static FormGroup get create {
    return FormGroup({
      _K.originLocationCode: FormControl<LocationAirport>(
        validators: [Validators.required],
      ),
      _K.destinationLocationCode: FormControl<LocationAirport>(
        validators: [Validators.required],
      ),
      _K.departureDate: FormControl<DateTime>(
        validators: [Validators.required],
      ),
      _K.returnDate: FormControl<DateTime>(),
      _K.passengers: FormControl<PassengerCount>(
        validators: [Validators.required],
      ),
      _K.travelClass: FormControl<TravelClass>(
        validators: [Validators.required],
      ),
    });
  }
}
