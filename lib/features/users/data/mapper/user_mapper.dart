import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/features/users/data/network/network_user.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';

extension NetworkUserToEntityMapper on NetworkUser {
  UserResource asEntity() => UserResource(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        dateOfBirth: dateOfBirth.let(DateTime.parse),
      );
}
