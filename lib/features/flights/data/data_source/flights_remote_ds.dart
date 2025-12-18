import 'package:dio/dio.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/core/network/index_response.dart';
import 'package:flight_booking_app/features/flights/data/models/network_location_airport.dart';
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

  Future<IndexResponse<NetworkLocationAirport>> searchAirportsByQuery(
    String query,
  ) async {
    final parameters = {'keyword': query, 'subType': 'CITY'};
    return httpClient
        .get<Json>('/reference-data/locations', queryParameters: parameters)
        .then(
          (res) => IndexResponse.fromJson(
            res.data!,
            mapper: NetworkLocationAirport.fromJson,
          ),
        );
  }
}
