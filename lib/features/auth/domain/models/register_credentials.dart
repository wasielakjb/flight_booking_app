import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_credentials.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterCredentials extends Equatable {
  const RegisterCredentials({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory RegisterCredentials.fromJson(Json json) =>
      _$RegisterCredentialsFromJson(json);

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  Json toJson() => _$RegisterCredentialsToJson(this);

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
      ];
}
