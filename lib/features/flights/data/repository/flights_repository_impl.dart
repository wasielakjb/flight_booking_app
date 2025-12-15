import 'package:flight_booking_app/features/flights/data/data_source/flights_remote_ds.dart';
import 'package:flight_booking_app/features/flights/data/mapper/location_airport_mapper.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  FlightsRepositoryImpl({required this.remoteDS});

  @protected
  final FlightsRemoteDataSource remoteDS;

  @override
  Future<List<LocationAirport>> searchAirportAndCity(String value) {
    return remoteDS
        .searchAirportAndCity(value)
        .then((res) => res.data.map((e) => e.asEntity()).toList());
  }
}
