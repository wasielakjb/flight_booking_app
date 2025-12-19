// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkItinerary _$NetworkItineraryFromJson(Map<String, dynamic> json) =>
    NetworkItinerary(
      duration: json['duration'] as String,
      segments: (json['segments'] as List<dynamic>)
          .map((e) => NetworkSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
