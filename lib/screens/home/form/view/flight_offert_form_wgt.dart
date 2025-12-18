import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/screens/home/form/cubit/flight_offert_form_cubit.dart';
import 'package:flight_booking_app/screens/home/form/form_builders/flight_offert_form_keys.dart';
import 'package:flight_booking_app/screens/home/form/widgets/reactive_form_airport_field.dart';
import 'package:flight_booking_app/screens/home/form/widgets/reactive_form_passengers_field.dart';
import 'package:flight_booking_app/screens/home/form/widgets/reactive_form_travel_class_field.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/cubit/form_cubit.dart';
import 'package:flight_booking_app/templates/form/ui/reactive_form_date_time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightOffertFormKeys;

class FlightOffertFormWidget extends StatelessWidget {
  const FlightOffertFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightOffertFormCubit(
        repository: inject<FlightsRepository>(),
      ),
      lazy: false,
      child: Builder(
        builder: (context) {
          final formCubit = context.watch<FlightOffertFormCubit>();
          return ReactiveForm(
            formGroup: formCubit.formGroup,
            canPop: (formGroup) => formGroup.pristine,
            child: Column(
              spacing: 18,
              children: [
                ReactiveFormAirportField(
                  formControlName: _K.originLocationCode,
                  prefixIcon: Icons.flight_takeoff,
                  placeholder: 'Select departure airport.',
                ),
                ReactiveFormAirportField(
                  formControlName: _K.destinationLocationCode,
                  prefixIcon: Icons.flight_land,
                  placeholder: 'Select arrival airport.',
                ),
                Row(
                  spacing: 18,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ReactiveFormDateTimeField(
                        formControlName: _K.departureDate,
                        prefixIcon: Iconsax.calendar_bold,
                        placeholder: 'Departure date.',
                      ),
                    ),
                    Expanded(
                      child: ReactiveFormPassengersField(
                        formControlName: _K.passengers,
                        prefixIcon: Icons.person,
                        placeholder: 'Number of passengers.',
                      ),
                    ),
                  ],
                ),
                ReactiveFormTravelClassField<TravelClass, TravelClass>(
                  formControlName: _K.travelClass,
                  prefixIcon: Icons.flight_class,
                  placeholder: 'Select a travel class.',
                  items: TravelClass.values,
                  labelBuilder: (item) => item.resolveName(),
                  itemBuilder: (context, item) => Text(item.resolveName()),
                ),
                BlocBuilder<FlightOffertFormCubit, FormCubitState>(
                  builder: (context, state) => ReactiveFormConsumer(
                    builder: (context, formGroup, child) => FilledButton(
                      onPressed: !state.pending ? formCubit.submit : null,
                      child: AnyButtonContent.filled(
                        text: 'Search',
                        pending: state.pending,
                        fullWidth: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
