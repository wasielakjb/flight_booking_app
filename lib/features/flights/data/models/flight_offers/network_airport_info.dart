import 'package:flight_booking_app/core/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_airport_info.g.dart';

@JsonSerializable(createToJson: false)
class NetworkAirportInfo {
  NetworkAirportInfo({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  factory NetworkAirportInfo.fromJson(Json json) =>
      _$NetworkAirportInfoFromJson(json);

  final String iataCode;
  final String? terminal;
  final String at;
}
