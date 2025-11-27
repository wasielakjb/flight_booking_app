import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkUser extends Equatable {
  const NetworkUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
  });

  factory NetworkUser.fromJson(Json json) => _$NetworkUserFromJson(json);

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? dateOfBirth;

  Json toJson() => _$NetworkUserToJson(this);

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
