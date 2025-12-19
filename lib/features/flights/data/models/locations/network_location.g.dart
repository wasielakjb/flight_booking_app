// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkLocation _$NetworkLocationFromJson(Map<String, dynamic> json) =>
    NetworkLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      detailedName: json['detailedName'] as String,
      iataCode: json['iataCode'] as String,
      address: NetworkAddress.fromJson(json['address'] as Map<String, dynamic>),
      timeZoneOffset: json['timeZoneOffset'] as String,
      geoCode: json['geoCode'] as Map<String, dynamic>,
    );
