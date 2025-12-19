import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/core/network/index_response.dart';

typedef Mapper<T> = T Function(Json json); 

class LocationsResponse<T> extends Equatable {
  const LocationsResponse({
    required this.meta,
    required this.data,
  });

  factory LocationsResponse.fromJson(Json json, {Mapper<T>? mapper}) {
    return LocationsResponse(
      meta: MetaData.fromJson(json['meta'] as Json),
      data: (json['data'] as List)
          .cast<Json>()
          .map((e) => mapper?.call(e) ?? e as T)
          .toList(),
    );
  }

  final MetaData meta;
  final List<T> data;
  
  @override
  List<Object?> get props => [meta, data];
}
