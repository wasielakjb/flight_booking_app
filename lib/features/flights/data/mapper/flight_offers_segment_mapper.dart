import 'package:flight_booking_app/features/flights/data/mapper/flight_offers_airport_info_mapper.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_segment.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/segment.dart';

extension FlightOffersSegmentToEntityMapper on NetworkSegment {
  Segment asEntity() => Segment(
        id: id,
        departure: departure.asEntity(),
        arrival: arrival.asEntity(),
        carrierCode: carrierCode,
        number: number,
        aircraftCode: aircraft['code'] as String,
        operatingCarrierName: operating['carrierName'] as String?,
        duration: duration.toDuration(),
        numberOfStops: numberOfStops,
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
