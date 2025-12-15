import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flight_booking_app/templates/status_widgets/app_empty.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AirportSelectorBottom extends StatefulWidget {
  const AirportSelectorBottom({super.key});

  static Future<LocationAirport?> show(BuildContext c) async {
    return showModalBottomSheet(
      context: c,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const AirportSelectorBottom(),
    );
  }

  @override
  State<AirportSelectorBottom> createState() => _AirportSelectorBottomState();
}

class _AirportSelectorBottomState extends State<AirportSelectorBottom> {
  final SearchController _controller = SearchController();
  List<LocationAirport> airports = <LocationAirport>[];

  Future<void> search(String value) async {
    if (value.isEmpty) {
      airports = [];
      setState(() {});
      return;
    }
    final repo = inject<FlightsRepository>();
    airports = await repo.searchAirportAndCity(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BottomSheetHeader(
            padding: EdgeInsets.all(20),
            title: 'Select City or Airport',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(
              controller: _controller,
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.fromLTRB(20, 0, 4, 0)),
              backgroundColor: WidgetStatePropertyAll(context.surfaceContainer),
              hintStyle: WidgetStatePropertyAll(
                context.bodyLarge.copyWith(
                  color: context.onSurface.withValues(alpha: 0.4),
                ),
              ),
              textStyle: WidgetStatePropertyAll(context.bodyLarge),
              leading: const Icon(Iconsax.search_normal_1_outline),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              onSubmitted: search,
              hintText: 'Enter city or airport name',
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) {
              if (airports.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(top: 160),
                  child: AppEmpty(),
                );
              }
              return Expanded(
                child: ListView.separated(
                  itemCount: airports.length,
                  itemBuilder: (context, index) {
                    final item = airports[index];
                    return InkWell(
                      onTap: () => context.pop(item),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        child: Row(
                          spacing: 8,
                          children: [
                            const Icon(Iconsax.airplane_bold),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '[${item.iataCode}] ${item.name}',
                                  style: context.titleMedium,
                                  overflow: TextOverflow.clip,
                                ),
                                Text(item.address.countryName),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
