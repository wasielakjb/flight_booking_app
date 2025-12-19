import 'package:dio/dio.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_flight_offer.dart';
import 'package:flight_booking_app/features/flights/data/models/locations/network_location.dart';
import 'package:flight_booking_app/features/flights/data/models/response/flight_offers_response.dart';
import 'package:flight_booking_app/features/flights/data/models/response/locations_response.dart';
import 'package:flight_booking_app/http/di/di.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class FlightsRemoteDataSource {
  FlightsRemoteDataSource({
    @Named(AmadeusHttpClient) required this.httpClient,
  });

  @protected
  final Dio httpClient;

  Future<LocationsResponse<NetworkLocation>> searchAirportsByQuery(
    String query,
  ) {
    const baseLink = '/v1/reference-data/locations';
    final parameters = {'keyword': query, 'subType': 'CITY'};
    return httpClient.get<Json>(baseLink, queryParameters: parameters).then(
          (res) => LocationsResponse.fromJson(
            res.data!,
            mapper: NetworkLocation.fromJson,
          ),
        );
  }

  Future<FlightOffersResponse<NetworkFlightOffer>> searchFlightOffers(
    Json payload,
  ) {
    const baseLink = '/v2/shopping/flight-offers';
    return httpClient.get<Json>(baseLink, queryParameters: payload).then(
          (res) => FlightOffersResponse.fromJson(
            res.data!,
            mapper: NetworkFlightOffer.fromJson,
          ),
        );
  }
}
