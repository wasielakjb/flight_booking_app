import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_airport_info.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/airport_info.dart';

extension FlightOffersAirportInfoToEntityMapper on NetworkAirportInfo {
  AirportInfo asEntity() => AirportInfo(
        iataCode: iataCode,
        terminal: terminal,
        at: DateTime.parse(at),
      );
}
