// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_offert_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FlightOffertRequestToJson(
        FlightOffertRequest instance) =>
    <String, dynamic>{
      'origin_location_code': instance.originLocationCode,
      'destination_location_code': instance.destinationLocationCode,
      'departure_date':
          const DateOnlyConverter().toJson(instance.departureDate),
      'return_date': _$JsonConverterToJson<String, DateTime>(
          instance.returnDate, const DateOnlyConverter().toJson),
      'adults': instance.adults,
      'children': instance.children,
      'infants': instance.infants,
      'travel_class': _$TravelClassEnumMap[instance.travelClass]!,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

const _$TravelClassEnumMap = {
  TravelClass.economy: 'ECONOMY',
  TravelClass.premiumEconomy: 'PREMIUM_ECONOMY',
  TravelClass.business: 'BUSINESS',
  TravelClass.first: 'FIRST',
};
