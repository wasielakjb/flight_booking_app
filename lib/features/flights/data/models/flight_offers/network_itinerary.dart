import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_segment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_itinerary.g.dart';

@JsonSerializable(createToJson: false)
class NetworkItinerary {
  NetworkItinerary({
    required this.duration,
    required this.segments,
  });

  factory NetworkItinerary.fromJson(Json json) =>
      _$NetworkItineraryFromJson(json);

  final String duration;
  final List<NetworkSegment> segments;
}
