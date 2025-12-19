import 'package:flight_booking_app/features/flights/data/models/flight_offers/network_price.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/price.dart';

extension FlightOffersPriceToEntityMapper on NetworkPrice {
  Price asEntity() => Price(
        currency: currency,
        total: double.parse(total),
        base: double.parse(base),
        grandTotal: double.parse(grandTotal),
      );
}
