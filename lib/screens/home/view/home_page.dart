import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/users/cubit/user_cubit.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flight_booking_app/screens/home/widgets/home_user_header_wgt.dart';
import 'package:flight_booking_app/screens/home/widgets/search_form/home_search_form.dart';
import 'package:flight_booking_app/templates/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(
        repository: inject<UserRepository>(),
      ),
      lazy: false,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = context.watch<UserCubit>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            color: context.primary,
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                HomeUserHeaderWidget(resource: userCubit.state.current),
                const SizedBox(height: 28),
                Text(
                  'Let’s Book your  next trip',
                  style: context.displayLarge.copyWith(color: context.surface),
                ),
                const SizedBox(height: 28),
                const HomeSearchForm(),        
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppNavigationBar(activeRoute: HomeRoute()),
    );
  }
}
