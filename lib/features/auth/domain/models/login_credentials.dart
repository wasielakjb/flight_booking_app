import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_credentials.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginCredentials extends Equatable {
  const LoginCredentials({
    required this.email,
    required this.password,
  });

  factory LoginCredentials.fromJson(Json json) =>
      _$LoginCredentialsFromJson(json);

  final String email;
  final String password;

  Json toJson() => _$LoginCredentialsToJson(this);

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
