enum TravelClass {
  economy,
  economyPremium,
  business,
  first;

  String resolveName() => switch (this) {
        economy => 'Economy',
        economyPremium => 'Economy Premium',
        business => 'Business',
        first => 'First',
      };
}
