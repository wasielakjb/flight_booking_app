import 'package:flight_booking_app/core/request/form_request.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/flight_offer.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';

abstract interface class FlightsRepository {
  Future<List<Location>> searchAirportsByQuery(String query);

  Future<List<FlightOffer>> searchFlightOffers(covariant FormRequest request);
}
