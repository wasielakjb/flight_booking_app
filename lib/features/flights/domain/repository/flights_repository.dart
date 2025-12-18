import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';

abstract interface class FlightsRepository {
  Future<List<LocationAirport>> searchAirportsByQuery(String query);
}
