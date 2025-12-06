enum TravelClass {
  first,
  economy,
  business,
  premiumEconomy;

  String resolveName() => switch (this) {
        first => 'First Class',
        economy => 'Economy Class',
        business => 'Business Class',
        premiumEconomy => 'Premium Economy',
      };
}
