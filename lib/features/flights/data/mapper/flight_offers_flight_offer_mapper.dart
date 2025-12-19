import 'package:flight_booking_app/features/flights/data/mapper/flight_offers_itinerary_mapper.dart';
import 'package:flight_booking_app/features/flights/data/mapper/flight_offers_price_mapper.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_flight_offer.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/flight_offer.dart';

extension FlightOffersFlightOfferToEntityMapper on NetworkFlightOffer {
  FlightOffer asEntity() => FlightOffer(
        id: id,
        oneWay: oneWay,
        numberOfSeats: numberOfBookableSeats,
        itineraries: itineraries.map((e) => e.asEntity()).toList(),
        price: price.asEntity(),
        airlineCodes: validatingAirlineCodes,
      );
}
