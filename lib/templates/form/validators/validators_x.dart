import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/templates/form/validators/passenger_count_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class ValidatorsX {
    static Validator<PassengerCount> get passengersCount => const PassengerCountValidator();
}
