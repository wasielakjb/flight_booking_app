import 'package:flight_booking_app/core/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_price.g.dart';

@JsonSerializable(createToJson: false)
class NetworkPrice {
  NetworkPrice({
    required this.currency,
    required this.total,
    required this.base,
    required this.grandTotal,
  });

  factory NetworkPrice.fromJson(Json json) => _$NetworkPriceFromJson(json);

  final String currency;
  final String total;
  final String base;
  final String grandTotal;
}
