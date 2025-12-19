import 'package:equatable/equatable.dart';

class Price extends Equatable {
  const Price({
    required this.currency,
    required this.total,
    required this.base,
    required this.grandTotal,
  });

  final String currency;
  final double total;
  final double base;
  final double grandTotal;

  @override
  List<Object?> get props => [
        currency,
        total,
        base,
        grandTotal,
      ];
}
