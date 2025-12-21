import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/core/request/form_request.dart';
import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_offert_request.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class FlightOffertRequest implements FormRequest {
  FlightOffertRequest({
    required this.originLocationCode,
    required this.destinationLocationCode,
    required this.departureDate,
    required this.adults,
    required this.children,
    required this.infants,
    required this.travelClass,
    this.nonStop = true,
  });

  final String originLocationCode;
  final String destinationLocationCode;
  @DateOnlyConverter()
  final DateTime departureDate;
  final int adults;
  final int? children;
  final int? infants;
  final TravelClass travelClass;
  final bool nonStop;

  @override
  Json toJson() => _$FlightOffertRequestToJson(this);
}

class DateOnlyConverter implements JsonConverter<DateTime, String> {
  const DateOnlyConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => DateFormat('yyyy-MM-dd').format(object);
}
