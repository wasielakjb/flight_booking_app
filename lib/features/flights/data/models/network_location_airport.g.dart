// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_location_airport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkLocationAirport _$NetworkLocationAirportFromJson(
        Map<String, dynamic> json) =>
    NetworkLocationAirport(
      id: json['id'] as String,
      type: json['type'] as String,
      subType: json['subType'] as String,
      name: json['name'] as String,
      detailedName: json['detailedName'] as String,
      timeZoneOffset: json['timeZoneOffset'] as String,
      iataCode: json['iataCode'] as String,
      geoCode: json['geoCode'] as Map<String, dynamic>,
      address: json['address'] as Map<String, dynamic>,
    );
