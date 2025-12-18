import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/core/request/form_request.dart';
import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_offert_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class FlightOffertRequest implements FormRequest {
  FlightOffertRequest({
    required this.originLocationCode,
    required this.destinationLocationCode,
    required this.departureDate,
    required this.returnDate,
    required this.adults,
    required this.children,
    required this.infants,
    required this.travelClass,
  });

  final String originLocationCode;
  final String destinationLocationCode;
  @DateOnlyConverter()
  final DateTime departureDate;
  @DateOnlyConverter()
  final DateTime? returnDate;
  final int adults;
  final int? children;
  final int? infants;
  final TravelClass travelClass;

  @override
  Json toJson() => _$FlightOffertRequestToJson(this);
}

class DateOnlyConverter implements JsonConverter<DateTime, String> {
  const DateOnlyConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => DateFormat('YYYY-MM-DD').format(object);
}
