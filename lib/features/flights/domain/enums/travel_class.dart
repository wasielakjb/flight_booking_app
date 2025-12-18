import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum TravelClass {
  economy,
  premiumEconomy,
  business,
  first;

  String resolveName() => switch (this) {
        first => 'First Class',
        economy => 'Economy Class',
        business => 'Business Class',
        premiumEconomy => 'Premium Economy',
      };
}
