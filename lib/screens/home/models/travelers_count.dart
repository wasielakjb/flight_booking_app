import 'package:equatable/equatable.dart';

class TravelersCount extends Equatable {
  const TravelersCount({
    required this.adults,
    required this.children,
    required this.infants,
  });

  final int adults;
  final int children;
  final int infants;

  int get count => adults + children + infants; 

  TravelersCount copyWith({
    int? adults,
    int? children,
    int? infants,
  }) {
    return TravelersCount(
      adults: adults ?? this.adults,
      children: children ?? this.children,
      infants: infants ?? this.infants,
    );
  }

  @override
  List<Object?> get props => [
        adults,
        children,
        infants,
      ];
}
