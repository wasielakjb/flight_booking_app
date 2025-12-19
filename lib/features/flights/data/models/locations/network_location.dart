import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/features/flights/data/models/locations/network_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_location.g.dart';

@JsonSerializable(createToJson: false)
class NetworkLocation {
  NetworkLocation({
    required this.id,
    required this.name,
    required this.detailedName,
    required this.iataCode,
    required this.address,
    required this.timeZoneOffset,
    required this.geoCode,
  });

  factory NetworkLocation.fromJson(Json json) =>
      _$NetworkLocationFromJson(json);

  final String id;
  final String name;
  final String detailedName;
  final String iataCode;
  final NetworkAddress address;
  final String timeZoneOffset;
  final Json geoCode;
}
