import 'package:flight_booking_app/features/flights/data/mapper/locations_address_mapper.dart';
import 'package:flight_booking_app/features/flights/data/models/locations/network_location.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';

extension NetworkLocationsLocationToEntityMapper on NetworkLocation {
  Location asEntity() => Location(
        id: id,
        name: name.formatName,
        details: detailedName,
        iataCode: iataCode,
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
