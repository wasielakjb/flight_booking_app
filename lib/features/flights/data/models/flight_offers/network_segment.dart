import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_airport_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_segment.g.dart';

@JsonSerializable(createToJson: false)
class NetworkSegment {
  NetworkSegment({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.carrierCode,
    required this.number,
    required this.aircraft,
    required this.operating,
    required this.duration,
    required this.numberOfStops,
  });

  factory NetworkSegment.fromJson(Json json) => _$NetworkSegmentFromJson(json);

  final String id;
  final NetworkAirportInfo departure;
  final NetworkAirportInfo arrival;
  final String carrierCode;
  final String number;
  final Json aircraft;
  final Json operating;
  final String duration;
  final int numberOfStops;
}
