import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';
import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/form_builders/flights_form_keys.dart';
import 'package:flight_booking_app/templates/form/validators/validators_x.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightsFormKeys;

class FlightsFormGroupFactory {
  static FormGroup create() {
    return FormGroup({
      _K.origin: FormControl<Location>(
        validators: [Validators.required],
      ),
      _K.destination: FormControl<Location>(
        validators: [Validators.required],
      ),
      _K.departureDate: FormControl<DateTime>(
        validators: [Validators.required],
      ),
      _K.passengers: FormControl<PassengerCount>(
        validators: [ValidatorsX.passengersCount],
      ),
      _K.travelClass: FormControl<TravelClass>(
        validators: [Validators.required],
      ),
    });
  }
}
