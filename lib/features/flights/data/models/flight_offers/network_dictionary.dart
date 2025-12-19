import 'package:flight_booking_app/core/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_dictionary.g.dart';

@JsonSerializable(createToJson: false)
class NetworkDictionary {
  NetworkDictionary({
    required this.locations,
    required this.aircraft,
    required this.currencies,
    required this.carriers,
  });

  factory NetworkDictionary.fromJson(Json json) =>
      _$NetworkDictionaryFromJson(json);

  final Json? locations;
  final Json? aircraft;
  final Json? currencies;
  final Json? carriers;
}
