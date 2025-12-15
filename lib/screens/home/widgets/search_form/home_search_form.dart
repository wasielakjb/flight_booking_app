import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/features/flights/domain/models/location_airport.dart';
import 'package:flight_booking_app/screens/home/widgets/airport_field/form_airport_field.dart';
import 'package:flight_booking_app/screens/home/widgets/form_passengers_field.dart';
import 'package:flight_booking_app/screens/home/widgets/form_travel_class_field.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/form_date_time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeSearchForm extends StatefulWidget {
  const HomeSearchForm({super.key});

  @override
  State<HomeSearchForm> createState() => _HomeSearchFormState();
}

class _HomeSearchFormState extends State<HomeSearchForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  FormBuilderState? get formState => _formKey.currentState;

  void swapAirports() {
    final form = _formKey.currentState;
    if (form == null) return;

    final origin = form.fields['origin']?.value as LocationAirport?;
    final destination = form.fields['destination']?.value as LocationAirport?;

    form.fields['origin']?.didChange(destination);
    form.fields['destination']?.didChange(origin);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: context.surface,
        boxShadow: [
          BoxShadow(
            color: context.onSurface.withValues(alpha: 0.1),
            offset: const Offset(0, 2),
            spreadRadius: 4,
            blurRadius: 8,
          ),
        ],
      ),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Column(
                  spacing: 8,
                  children: [
                    FormAirportField(
                      name: 'origin',
                      prefixIcon: Icons.flight_takeoff,
                      placeholder: 'Enter a city or airport.',
                    ),
                    FormAirportField(
                      name: 'destination',
                      prefixIcon: Icons.flight_land,
                      placeholder: 'Enter a city or airport.',
                    ),
                  ],
                ),
                Positioned(
                  right: 32,
                  top: 28,
                  child: IconButton.filled(
                    onPressed: swapAirports,
                    icon: const Icon(Iconsax.arrow_swap_outline),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  flex: 4,
                  child: FormDateTimeField(
                    name: 'departure_date',
                    prefixIcon: Iconsax.calendar_bold,
                    placeholder: 'Select a departure date.',
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: FormPassengersField(
                    name: 'passengers',
                    prefixIcon: Icons.person,
                    placeholder: 'Select number of passengers.',
                  ),
                ),
              ],
            ),
            FormTravelClassField(
              name: 'travel_class',
              prefixIcon: Icons.flight_class,
              placeholder: 'Select a travel class.',
            ),
            FilledButton(
              onPressed: () {},
              child: const AnyButtonContent.filled(
                text: 'Search',
                fullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
