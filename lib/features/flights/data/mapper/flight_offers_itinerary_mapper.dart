import 'package:flight_booking_app/features/flights/data/mapper/flight_offers_segment_mapper.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_itinerary.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/itinerary.dart';

extension FlightOffersItineraryToEntityMapper on NetworkItinerary {
  Itinerary asEntity() => Itinerary(
        duration: duration.toDuration(),
        segments: segments.map((e) => e.asEntity()).toList(),
      );
}

extension on String {
  Duration toDuration() {
    final regex = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?');
    final match = regex.firstMatch(this);

    if (match == null) {
      throw FormatException('Niepoprawny format ISO 8601 duration: $this');
    }

    return Duration(
      hours: int.parse(match.group(1) ?? '0'),
      minutes: int.parse(match.group(2) ?? '0'),
      seconds: int.parse(match.group(3) ?? '0'),
    );
  }
}
