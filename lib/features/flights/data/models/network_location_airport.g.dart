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
      subType: $enumDecode(_$LocationTypeEnumMap, json['subType']),
      name: json['name'] as String,
      detailedName: json['detailedName'] as String,
      timeZoneOffset: json['timeZoneOffset'] as String,
      iataCode: json['iataCode'] as String,
      geoCode: json['geoCode'] as Map<String, dynamic>,
      address: NetworkLocationAddress.fromJson(
          json['address'] as Map<String, dynamic>),
    );

const _$LocationTypeEnumMap = {
  LocationType.airport: 'AIRPORT',
  LocationType.city: 'CITY',
  LocationType.pointOfInterest: 'POINT_OF_INTEREST',
  LocationType.district: 'DISTRICT',
};
