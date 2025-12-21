import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/airport_info.dart';

class Segment extends Equatable {
  const Segment({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.carrierCode,
    required this.number,
    required this.aircraftCode,
    required this.operatingCarrierName,
    required this.duration,
    required this.numberOfStops,
  });

  final String id;
  final AirportInfo departure;
  final AirportInfo arrival;
  final String carrierCode;
  final String number;
  final String aircraftCode;
  final String? operatingCarrierName;
  final Duration duration;
  final int numberOfStops;

  @override
  List<Object?> get props => [
        id,
        departure,
        arrival,
        carrierCode,
        number,
        aircraftCode,
        operatingCarrierName,
        duration,
        numberOfStops,
      ];
}
