import 'package:flight_booking_app/features/flights/data/models/locations/network_address.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/address.dart';

extension NetworkLocationsAddressToEntityMapper on NetworkAddress {
  Address asEntity() => Address(
        city: cityName.capitalize(),
        cityCode: cityCode.toUpperCase(),
        country: countryName.capitalize(),
        countryCode: countryCode.toUpperCase(),
        regionCode: regionCode.toUpperCase(),
      );
}

extension on String? {
  String capitalize() {
    final value = this!.toLowerCase();
    return value[0].toUpperCase() + value.substring(1);
  }
}
