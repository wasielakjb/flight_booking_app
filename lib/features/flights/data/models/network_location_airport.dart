import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/features/flights/data/models/network_location_address.dart';
import 'package:flight_booking_app/features/flights/domain/enums/location_type.dart';
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
  final LocationType subType;
  final String name;
  final String detailedName;
  final String timeZoneOffset;
  final String iataCode;
  final Json geoCode;
  final NetworkLocationAddress address;
}
