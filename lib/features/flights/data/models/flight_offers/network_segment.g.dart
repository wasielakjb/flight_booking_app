// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkSegment _$NetworkSegmentFromJson(Map<String, dynamic> json) =>
    NetworkSegment(
      id: json['id'] as String,
      departure: NetworkAirportInfo.fromJson(
          json['departure'] as Map<String, dynamic>),
      arrival:
          NetworkAirportInfo.fromJson(json['arrival'] as Map<String, dynamic>),
      carrierCode: json['carrierCode'] as String,
      number: json['number'] as String,
      aircraft: json['aircraft'] as Map<String, dynamic>,
      operating: json['operating'] as Map<String, dynamic>,
      duration: json['duration'] as String,
      numberOfStops: (json['numberOfStops'] as num).toInt(),
    );
