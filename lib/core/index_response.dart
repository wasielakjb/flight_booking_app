import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:flutter/foundation.dart';

@immutable
class IndexResponse<T> extends Equatable {
  const IndexResponse({
    required this.data,
    required this.meta,
  });

  factory IndexResponse.fromJson(Json json, {T Function(Json json)? mapper}) {
    return IndexResponse(
      data: (json['data'] as List)
          .cast<Json>()
          .map((e) => mapper?.call(e) ?? e as T)
          .toList(),
      meta: MetaData.fromJson(json['meta'] as Json),
    );
  }

  final List<T> data;
  final MetaData meta;

  @override
  List<Object?> get props => [data, meta];
}

@immutable
class MetaData extends Equatable {
  const MetaData({
    required this.count,
    required this.links,
  });

  factory MetaData.fromJson(Json json) {
    return MetaData(
      count: json['count'] as int,
      links: json['links'] as Json,
    );
  }

  final int count;
  final Json links;

  @override
  List<Object?> get props => [count, links];
}
