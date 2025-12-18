import 'package:flight_booking_app/core/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessToken {
  AccessToken({
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.generatedAt,
  });

  factory AccessToken.fromJson(Json json) =>
      _$AccessTokenFromJson(json);

  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final DateTime generatedAt;

  String get requestToken => '$tokenType $accessToken';
  DateTime get expiresAt => generatedAt.add(Duration(seconds: expiresIn));
  bool get isExpired =>  DateTime.now().isAfter(expiresAt);

  Json toJson() => _$AccessTokenToJson(this);
}
