import 'package:flight_booking_app/features/flights/data/models/network_location_address.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_address.dart';

extension NetworkLocationAddressToEntityMapper on NetworkLocationAddress {
  LocationAddress asEntity() => LocationAddress(
        cityName: cityName.capitalize(),
        cityCode: cityCode.toUpperCase(),
        countryName: countryName.capitalize(),
        countryCode: countryCode.toUpperCase(),
        stateCode: stateCode?.toUpperCase(),
        regionCode: regionCode.toUpperCase(),
      );
}

extension on String? {
  String capitalize() {
    final value = this!.toLowerCase();
    return value[0].toUpperCase() + value.substring(1);
  }
}
