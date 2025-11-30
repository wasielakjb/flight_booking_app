import 'package:flight_booking_app/features/users/data/network/network_user.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';
import 'package:intl/intl.dart';

extension NetworkUserToEntityMapper on NetworkUser {
  UserResource asEntity() => UserResource(
        id: id,
        fullName: fullName,
        email: email,
        birthOfDate: DateFormat('d MMM yyyy').parse(birthOfDate),
        phoneNumer: phoneNumer,
      );
}
