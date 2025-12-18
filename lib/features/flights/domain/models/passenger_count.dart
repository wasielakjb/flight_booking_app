import 'package:equatable/equatable.dart';

class PassengerCount extends Equatable {
  const PassengerCount({
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
  });

  final int adults;
  final int children;
  final int infants;

  PassengerCount copyWith({
    int? adults,
    int? children,
    int? infants,
  }) {
    return PassengerCount(
      adults: adults ?? this.adults,
      children: children ?? this.children,
      infants: infants ?? this.infants,
    );
  }

  int get total => adults + children + infants;

  @override
  List<Object?> get props => [adults, children, infants];
}
