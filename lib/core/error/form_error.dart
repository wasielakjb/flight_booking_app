import 'package:flight_booking_app/core/error/base_error.dart';

sealed class FormImplementationError extends BaseError {}

class FormIncorrectRequestMapping extends FormImplementationError {}
