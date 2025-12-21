import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/screens/home/screens/flights_form/cubit/flights_form_cubit.dart';
import 'package:flight_booking_app/screens/home/screens/flights_result/widgets/flight_offer_item_wgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class FlightsResultPage extends StatelessWidget implements AutoRouteWrapper {
  const FlightsResultPage({
    required this.cubit,
    super.key,
  });

  final FlightsFormCubit cubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: BlocBuilder<FlightsFormCubit, FlightsFormState>(
        builder: (context, state) {
          return Skeletonizer(
          enabled: state.result == null,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: state.data?.length ?? 5,
            itemBuilder: (context, index) => FlightOfferItemWidget(
              item: state.data?[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        );
        },
      ),
    );
  }
}
