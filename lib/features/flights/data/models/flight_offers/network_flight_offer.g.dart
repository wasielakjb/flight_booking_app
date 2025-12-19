// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_flight_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkFlightOffer _$NetworkFlightOfferFromJson(Map<String, dynamic> json) =>
    NetworkFlightOffer(
      id: json['id'] as String,
      oneWay: json['oneWay'] as bool,
      numberOfBookableSeats: (json['numberOfBookableSeats'] as num).toInt(),
      itineraries: (json['itineraries'] as List<dynamic>)
          .map((e) => NetworkItinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: NetworkPrice.fromJson(json['price'] as Map<String, dynamic>),
      validatingAirlineCodes: (json['validatingAirlineCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
