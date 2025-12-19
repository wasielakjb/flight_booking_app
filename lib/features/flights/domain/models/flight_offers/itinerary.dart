import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/segment.dart';

class Itinerary extends Equatable {
  const Itinerary({
    required this.duration,
    required this.segments,
  });

  final Duration duration;
  final List<Segment> segments;

  @override
  List<Object?> get props => [
        duration,
        segments,
      ];
}
