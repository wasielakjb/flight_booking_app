import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_itinerary.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_flight_offer.g.dart';

@JsonSerializable(createToJson: false)
class NetworkFlightOffer {
  NetworkFlightOffer({
    required this.id,
    required this.oneWay,
    required this.numberOfBookableSeats,
    required this.itineraries,
    required this.price,
    required this.validatingAirlineCodes,
  });

  factory NetworkFlightOffer.fromJson(Json json) =>
      _$NetworkFlightOfferFromJson(json);

  final String id;
  final bool oneWay;
  final int numberOfBookableSeats;
  final List<NetworkItinerary> itineraries;
  final NetworkPrice price;
  final List<String> validatingAirlineCodes;
}
