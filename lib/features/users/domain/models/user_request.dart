import 'package:flight_booking_app/core/form_request.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserRequest implements FormRequest {
  UserRequest({
    required this.fullName,
    required this.birthOfDate,
    required this.phoneNumer,
  });

  factory UserRequest.fromJson(Json json) => _$UserRequestFromJson(json);
  
  final String fullName;
  final DateTime birthOfDate;
  final String phoneNumer;

  @override
  Json toJson() => _$UserRequestToJson(this);
}
