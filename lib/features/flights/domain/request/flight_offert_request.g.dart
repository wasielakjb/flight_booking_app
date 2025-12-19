// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_offert_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FlightOffertRequestToJson(
        FlightOffertRequest instance) =>
    <String, dynamic>{
      'originLocationCode': instance.originLocationCode,
      'destinationLocationCode': instance.destinationLocationCode,
      'departureDate': const DateOnlyConverter().toJson(instance.departureDate),
      if (_$JsonConverterToJson<String, DateTime>(
              instance.returnDate, const DateOnlyConverter().toJson)
          case final value?)
        'returnDate': value,
      'adults': instance.adults,
      if (instance.children case final value?) 'children': value,
      if (instance.infants case final value?) 'infants': value,
      'travelClass': _$TravelClassEnumMap[instance.travelClass]!,
      'nonStop': instance.nonStop,
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
