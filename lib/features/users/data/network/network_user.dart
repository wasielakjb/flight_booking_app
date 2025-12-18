import 'package:flight_booking_app/core/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkUser {
  const NetworkUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.birthOfDate,
    required this.phoneNumer,
  });

  factory NetworkUser.fromJson(Json json) => _$NetworkUserFromJson(json);

  final String id;
  final String fullName;
  final String email;
  final String birthOfDate;
  final String phoneNumer;

  Json toJson() => _$NetworkUserToJson(this);
}
