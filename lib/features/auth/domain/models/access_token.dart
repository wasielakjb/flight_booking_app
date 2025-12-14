import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessToken {
  AccessToken({
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
  }) : expiresAt = DateTime.now().add(Duration(seconds: expiresIn));

  factory AccessToken.fromJson(Json json) =>
      _$AccessTokenFromJson(json);

  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final DateTime expiresAt;

  String get requestToken => '$tokenType $accessToken';
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Json toJson() => _$AccessTokenToJson(this);
}
