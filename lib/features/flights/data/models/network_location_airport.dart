import 'package:flight_booking_app/extensions/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_location_airport.g.dart';

@JsonSerializable(createToJson: false)
class NetworkLocationAirport {
  NetworkLocationAirport({
    required this.id,
    required this.type,
    required this.subType,
    required this.name,
    required this.detailedName,
    required this.timeZoneOffset,
    required this.iataCode,
    required this.geoCode,
    required this.address,
  });

  factory NetworkLocationAirport.fromJson(Json json) =>
      _$NetworkLocationAirportFromJson(json);

  final String id;
  final String type;
  final String subType;
  final String name;
  final String detailedName;
  final String timeZoneOffset;
  final String iataCode;
  final Json geoCode;
  final Json address;
}
