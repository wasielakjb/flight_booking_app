import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
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
