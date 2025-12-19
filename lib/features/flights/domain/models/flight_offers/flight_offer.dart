import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/itinerary.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/price.dart';

class FlightOffer extends Equatable {
  const FlightOffer({
    required this.id,
    required this.oneWay,
    required this.numberOfSeats,
    required this.itineraries,
    required this.price,
    required this.airlineCodes,
  });

  final String id;
  final bool oneWay;
  final int numberOfSeats;
  final List<Itinerary> itineraries;
  final Price price;
  final List<String> airlineCodes;

  @override
  List<Object?> get props => [
        id,
        oneWay,
        numberOfSeats,
        itineraries,
        price,
        airlineCodes,
      ];
}
