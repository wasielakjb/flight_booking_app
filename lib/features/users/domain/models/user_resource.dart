import 'package:equatable/equatable.dart';

class UserResource extends Equatable {
  const UserResource({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final DateTime? dateOfBirth;

  String get fullName => '$firstName $lastName';
  String get nameLetter => '${firstName[0]}${lastName[0]}';

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        dateOfBirth,
      ];
}
