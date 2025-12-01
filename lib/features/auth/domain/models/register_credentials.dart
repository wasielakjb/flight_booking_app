import 'package:flight_booking_app/extensions/json.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_credentials.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterCredentials extends UserRequest {
  RegisterCredentials({
    required super.fullName,
    required super.birthOfDate,
    required super.phoneNumer,
    required this.email,
    required this.password,
  });

  factory RegisterCredentials.fromJson(Json json) =>
      _$RegisterCredentialsFromJson(json);

  final String email;
  final String password;

  @override
  Json toJson() => _$RegisterCredentialsToJson(this);
}
