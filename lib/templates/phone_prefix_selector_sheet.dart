import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PhonePrefixSelectorSheet extends StatelessWidget {
  const PhonePrefixSelectorSheet({
    required this.initialValue,
    super.key,
  });

  final CountryWithPhoneCode? initialValue;

  static Future<CountryWithPhoneCode?> show(
    BuildContext c,
    CountryWithPhoneCode? value,
  ) async {
    return showModalBottomSheet<CountryWithPhoneCode>(
      context: c,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      builder: (_) => PhonePrefixSelectorSheet(
        initialValue: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final countries = CountryManager().countries
    ..sort((a, b) => (a.countryName ?? '').compareTo(b.countryName ?? '')); 
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetHeader(title: 'Select country calling code'),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: countries.length,
              initialScrollIndex:
                  initialValue != null ? countries.indexOf(initialValue!) : 0,
              itemBuilder: (context, index) {
                final item = countries[index];
                final active = item == initialValue;
                return Container(
                  decoration: BoxDecoration(
                    color: active
                        ? context.secondaryContainer.withValues(alpha: 0.5)
                        : Colors.transparent,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: active
                            ? context.primary.withValues(alpha: 0.8)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () => context.router.maybePop(item),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      item.countryName ?? item.countryCode,
                      style: context.bodyMedium,
                    ),
                    leading: SizedBox(
                      width: 64,
                      child: Text(
                        '+${item.phoneCode}',
                        textAlign: TextAlign.end,
                        style: context.bodyMediumBold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
