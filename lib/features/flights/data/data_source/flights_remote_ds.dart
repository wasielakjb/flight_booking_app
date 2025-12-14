import 'package:dio/dio.dart';
import 'package:flight_booking_app/extensions/json.dart';
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

  Future<void> searchAirportAndCity(String search) async {
    return httpClient.get<Json>(
      '/reference-data/locations',
      queryParameters: {
        'keyword': search,
        'subType': 'AIRPORT',
      },
    ).then(print);
  }
}
