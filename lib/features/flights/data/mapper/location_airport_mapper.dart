import 'dart:math';

import 'package:flight_booking_app/features/flights/data/mapper/location_address_mapper.dart';
import 'package:flight_booking_app/features/flights/data/models/network_location_airport.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';

extension NetworkLocationAirportToEntityMapper on NetworkLocationAirport {
  LocationAirport asEntity() => LocationAirport(
        id: id,
        type: subType,
        name: name.formatName,
        detailedName: detailedName,
        iataCode: iataCode,
        geoCode: Point(geoCode['latitude'] as double, geoCode['longitude'] as double),
        address: address.asEntity(),
      );
}

extension on String {
  String get formatName {
    const lowercaseWords = {'de', 'of', 'and', 'the'};
    final words = toLowerCase().split(' ');
    return words.map((value) {
      return lowercaseWords.contains(value)
          ? value
          : value[0].toUpperCase() + value.substring(1);
    }).join(' ');
  }
}
