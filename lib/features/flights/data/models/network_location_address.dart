import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_location_address.g.dart';

@JsonSerializable(createToJson: false)
class NetworkLocationAddress {
  NetworkLocationAddress({
    required this.cityName,
    required this.cityCode,
    required this.countryName,
    required this.countryCode,
    required this.stateCode,
    required this.regionCode,
  });

  factory NetworkLocationAddress.fromJson(Json json) =>
      _$NetworkLocationAddressFromJson(json);

  final String cityName;
  final String cityCode;
  final String countryName;
  final String countryCode;
  final String? stateCode;
  final String regionCode;
}
