import 'package:flight_booking_app/features/flights/data/data_source/flights_remote_ds.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  FlightsRepositoryImpl({required this.remoteDS});

  @protected
  final FlightsRemoteDataSource remoteDS;

  @override
  Future<void> searchAirportAndCity() {
    return remoteDS.searchAirportAndCity('BER');
  }
}
