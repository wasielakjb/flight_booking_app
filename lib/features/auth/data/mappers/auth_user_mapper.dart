import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking_app/features/auth/domain/models/auth_user.dart';

extension AuthUserMapper on User {
  AuthUser asAuthUser() {
    return AuthUser(
      id: uid,
      email: email!,
    );
  }
}
