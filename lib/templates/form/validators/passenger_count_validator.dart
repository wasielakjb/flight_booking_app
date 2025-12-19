import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PassengerCountValidator extends Validator<PassengerCount> {
  const PassengerCountValidator() : super();

  static const errorName = 'passengerCountInvalid';

  @override
  Map<String, dynamic>? validate(AbstractControl<PassengerCount> control) {
    final value = control.value;
    if (value == null || value.total < 1) {
      return {errorName: true};
    }
    return null;
  }
}
