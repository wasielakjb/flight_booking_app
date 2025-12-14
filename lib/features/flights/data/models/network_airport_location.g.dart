// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_airport_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkAirportLocation _$NetworkAirportLocationFromJson(
        Map<String, dynamic> json) =>
    NetworkAirportLocation(
      id: json['id'] as String,
      type: json['type'] as String,
      subType: json['sub_type'] as String,
      name: json['name'] as String,
      detailedName: json['detailed_name'] as String,
      timeZoneOffset: json['time_zone_offset'] as String,
      iataCode: json['iata_code'] as String,
      geoCode: json['geo_code'] as Map<String, dynamic>,
      address: json['address'] as Map<String, dynamic>,
    );
