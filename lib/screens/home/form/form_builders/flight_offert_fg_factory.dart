import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';
import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/screens/home/form/form_builders/flight_offert_form_keys.dart';
import 'package:flight_booking_app/templates/form/validators/validators_x.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightOffertFormKeys;

class FlightOffertFormGroupFactory {
  static FormGroup get create {
    return FormGroup({
      _K.originLocationCode: FormControl<Location>(
        validators: [Validators.required],
      ),
      _K.destinationLocationCode: FormControl<Location>(
        validators: [Validators.required],
      ),
      _K.departureDate: FormControl<DateTime>(
        validators: [Validators.required],
      ),
      _K.returnDate: FormControl<DateTime>(),
      _K.passengers: FormControl<PassengerCount>(
        validators: [ValidatorsX.passengersCount],
      ),
      _K.travelClass: FormControl<TravelClass>(
        validators: [Validators.required],
      ),
    });
  }
}
