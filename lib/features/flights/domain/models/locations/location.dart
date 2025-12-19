import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/address.dart';

class Location extends Equatable {
  const Location({
    required this.id,
    required this.name,
    required this.details,
    required this.iataCode,
    required this.address,
  });

  final String id;
  final String name;
  final String details;
  final String iataCode;
  final Address address;

  @override
  List<Object?> get props => [
        id,
        name,
        details,
        iataCode,
        address,
      ];
}
