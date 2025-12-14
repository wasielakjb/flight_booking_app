import 'package:equatable/equatable.dart';

class LocationAddress extends Equatable {
  const LocationAddress({
    required this.cityName,
    required this.cityCode,
    required this.countryName,
    required this.countryCode,
    required this.stateCode,
    required this.regionCode,
  });

  final String cityName;
  final String cityCode;
  final String countryName;
  final String countryCode;
  final String stateCode;
  final String regionCode;

  @override
  List<Object?> get props => [
        cityName,
        cityCode,
        countryName,
        countryCode,
        stateCode,
        regionCode,
      ];
}
