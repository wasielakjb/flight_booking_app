import 'package:dio/dio.dart';
import 'package:flight_booking_app/core/index_response.dart';
import 'package:flight_booking_app/extensions/json.dart';
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

  Future<IndexResponse<NetworkLocationAirport>> searchAirportAndCity(
    String value,
  ) async {
    return httpClient.get<Json>(
      '/reference-data/locations',
      queryParameters: {
        'keyword': value,
        'subType': 'CITY',
      },
    ).then(
      (res) => IndexResponse.fromJson(
        res.data!,
        mapper: NetworkLocationAirport.fromJson,
      ),
    );
  }
}
