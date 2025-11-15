enum TripType {
  oneWay,
  roundTrip,
  multiCity;

  String resolveName() => switch (this) {
        oneWay => 'One-way',
        roundTrip => 'Round-Trip',
        multiCity => 'Multi-City',
      };
}
