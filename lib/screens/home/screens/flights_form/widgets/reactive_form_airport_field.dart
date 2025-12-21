import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/flights/domain/models/locations/location.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flight_booking_app/templates/form/ui/reactive_form_text_field.dart';
import 'package:flight_booking_app/templates/status_widgets/app_empty.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef ItemBuilder = Widget Function(BuildContext, Location);

class ReactiveFormAirportField extends StatelessWidget {
  ReactiveFormAirportField({
    required this.formControlName,
    this.placeholder,
    this.prefixIcon,
    this.validationMessages,
  }) : super(key: ValueKey(formControlName));

  final String? formControlName;
  final String? placeholder;
  final IconData? prefixIcon;
  final ValidationMsgMap? validationMessages;

  Widget prefixIconBuilder(IconData icon) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20),
              const VerticalDivider(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.surfaceContainer,
        ),
      ),
      child: ReactiveFocusableFormField<Location, Location>(
        formControlName: formControlName,
        validationMessages: validationMessages,
        builder: (field) => InkWell(
          onTap: () async {
            final res = await AirportBottomSheet.show(context);
            field.didChange(res);
          },
          child: InputDecorator(
            isEmpty: field.value == null,
            decoration: InputDecoration(
              hintText: placeholder,
              hintMaxLines: 1,
              errorText: field.errorText,
              errorMaxLines: 2,
              prefixIcon: prefixIcon.let(prefixIconBuilder),
              prefixIconConstraints: const BoxConstraints.tightFor(),
            ),
            child: field.value.let(
              (value) => Text(
                '${value.name}, ${value.address.country}',
                style: context.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AirportBottomSheet extends StatefulWidget {
  const AirportBottomSheet({super.key});

  static Future<Location?> show(BuildContext c) async {
    return showModalBottomSheet<Location>(
      context: c,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => const AirportBottomSheet(),
    );
  }

  @override
  State<AirportBottomSheet> createState() => _AirportBottomSheetState();
}

class _AirportBottomSheetState extends State<AirportBottomSheet> {
  final _results = ValueNotifier<List<Location>>([]);

  @override
  void dispose() {
    _results.dispose();
    super.dispose();
  }

  Future<void> searchAirportsByQuery(String query) async {
    final repo = inject<FlightsRepository>();
    final res = await repo.searchAirportsByQuery(query);
    _results.value = res;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BottomSheetHeader(
          padding: EdgeInsets.all(20),
          title: 'Select City or Airport',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(
            leading: const Icon(Iconsax.search_normal_1_outline),
            hintText: 'Enter city or airport name',
            keyboardType: TextInputType.text,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            onSubmitted: searchAirportsByQuery,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ValueListenableBuilder<List<Location>>(
            valueListenable: _results,
            builder: (context, value, child) {
              if (value.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: AppEmpty(),
                );
              }

              return ListView.separated(
                itemCount: value.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => context.pop(value[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      spacing: 8,
                      children: [
                        const Icon(Iconsax.airplane_bold),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '[${value[index].iataCode}] ${value[index].name}',
                              style: context.titleMedium,
                              overflow: TextOverflow.clip,
                            ),
                            Text(value[index].address.country),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 8),
              );
            },
          ),
        ),
      ],
    );
  }
}
