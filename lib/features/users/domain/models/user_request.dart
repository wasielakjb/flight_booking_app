import 'package:flight_booking_app/core/form_request.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class UserRequest implements FormRequest {
  UserRequest({
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
  final String? dateOfBirth;

  @override
  Json toJson() => _$UserRequestToJson(this);
}
