import 'package:equatable/equatable.dart';

class AirportInfo extends Equatable {
  const AirportInfo({
    required this.iataCode,
    required this.terminal,
    required this.at,
  });

  final String iataCode;
  final String? terminal;
  final DateTime at;

  @override
  List<Object?> get props => [
        iataCode,
        terminal,
        at,
      ];
}
