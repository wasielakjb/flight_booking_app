import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/features/flights/domain/enums/travel_class.dart';
import 'package:flight_booking_app/features/flights/domain/repository/flights_repository.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/cubit/flights_form_cubit.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/form_builders/flights_form_keys.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/widgets/reactive_form_airport_field.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/widgets/reactive_form_passengers_field.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/widgets/reactive_form_travel_class_field.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/ui/reactive_form_date_time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = FlightsFormKeys;

class FlightsFormWidget extends StatelessWidget {
  const FlightsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightsFormCubit(
        repository: inject<FlightsRepository>(),
      ),
      lazy: false,
      child: Builder(
        builder: (context) {
          final formCubit = context.watch<FlightsFormCubit>();
          return ReactiveForm(
            formGroup: formCubit.formGroup,
            canPop: (formGroup) => formGroup.pristine,
            child: Column(
              spacing: 18,
              children: [
                ReactiveFormAirportField(
                  formControlName: _K.origin,
                  prefixIcon: Icons.flight_takeoff,
                  placeholder: 'Select departure airport.',
                ),
                ReactiveFormAirportField(
                  formControlName: _K.destination,
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
                BlocBuilder<FlightsFormCubit, FlightsFormState>(
                  builder: (context, state) => ReactiveFormConsumer(
                    builder: (context, formGroup, child) => FilledButton(
                      onPressed: !state.pending
                          ? () async {
                              await formCubit.submit();
                              if ((state.result?.isSuccess ?? false) &&
                                  context.mounted) {
                                await context.pushRoute(
                                  FlightsResultRoute(cubit: formCubit),
                                );
                              }
                            }
                          : null,
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
