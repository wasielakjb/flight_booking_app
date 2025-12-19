import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.city,
    required this.cityCode,
    required this.country,
    required this.countryCode,
    required this.regionCode,
  });

  final String city;
  final String cityCode;
  final String country;
  final String countryCode;
  final String regionCode;
  @override
  List<Object?> get props => [
        city,
        cityCode,
        country,
        countryCode,
        regionCode,
      ];
}
