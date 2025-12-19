import 'package:flight_booking_app/core/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_address.g.dart';

@JsonSerializable(createToJson: false)
class NetworkAddress {
  NetworkAddress({
    required this.cityName,
    required this.cityCode,
    required this.countryName,
    required this.countryCode,
    required this.regionCode,
  });

  factory NetworkAddress.fromJson(Json json) => _$NetworkAddressFromJson(json);

  final String cityName;
  final String cityCode;
  final String countryName;
  final String countryCode;
  final String regionCode;
}
