import 'package:flight_booking_app/features/flights/data/data_source/flights_remote_ds.dart';
import 'package:flight_booking_app/features/flights/data/mapper/flight_offers_flight_offer_mapper.dart';
import 'package:flight_booking_app/features/flights/data/mapper/locations_location_mapper.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/flight_offer.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/features/flights/domain/request/flight_offert_request.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  FlightsRepositoryImpl({required this.remoteDS});

  @protected
  final FlightsRemoteDataSource remoteDS;

  @override
  Future<List<Location>> searchAirportsByQuery(String query) {
    return remoteDS
        .searchAirportsByQuery(query)
        .then((res) => res.data.map((e) => e.asEntity()).toList());
  }

  @override
  Future<List<FlightOffer>> searchFlightOffers(FlightOffertRequest request) {
    return remoteDS
        .searchFlightOffers(request.toJson())
        .then((res) => res.data.map((e) => e.asEntity()).toList());
  }
}
