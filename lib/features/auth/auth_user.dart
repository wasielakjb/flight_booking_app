import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  const AuthUser({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
  });

  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String? dateOfBirth;
  final String? phone;

  String get nameLetter => firstName.isNotEmpty ? firstName[0] : '';

  @override
  List<Object?> get props => [
        uid,
        firstName,
        lastName,
        email,
        dateOfBirth,
        phone,
      ];
}
