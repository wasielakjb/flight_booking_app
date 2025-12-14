
import 'package:flight_booking_app/features/auth/exceptions/auth_exception.dart';

class NoTokenStoredException extends AuthException {
  @override
  String get message => 'requesting authorized url when no token is stored.';
}
