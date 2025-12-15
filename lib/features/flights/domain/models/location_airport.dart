import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/flights/domain/enums/location_type.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_address.dart';

class LocationAirport extends Equatable {
  const LocationAirport({
    required this.id,
    required this.type,
    required this.name,
    required this.detailedName,
    required this.iataCode,
    required this.geoCode,
    required this.address,
  });

  final String id;
  final LocationType type;
  final String name;
  final String detailedName;
  final String iataCode;
  final Point geoCode;
  final LocationAddress address;

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        detailedName,
        iataCode,
        geoCode,
        address,
      ];
}
