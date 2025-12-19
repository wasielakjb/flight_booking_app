import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/core/network/index_response.dart';
import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_dictionary.dart';

typedef Mapper<T> = T Function(Json json); 

class FlightOffersResponse<T> extends Equatable {
  const FlightOffersResponse({
    required this.meta,
    required this.data,
    required this.dictionaries,
  });

  factory FlightOffersResponse.fromJson(Json json, {Mapper<T>? mapper}) {
    return FlightOffersResponse(
      meta: MetaData.fromJson(json['meta'] as Json),
      data: (json['data'] as List)
          .cast<Json>()
          .map((e) => mapper?.call(e) ?? e as T)
          .toList(),
      dictionaries: NetworkDictionary.fromJson(json),
    );
  }

  final MetaData meta;
  final List<T> data;
  final NetworkDictionary dictionaries;

  @override
  List<Object?> get props => [
        meta,
        data,
        dictionaries,
      ];
}
