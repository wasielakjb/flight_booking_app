import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/users/cubit/user_cubit.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flight_booking_app/screens/settings/widgets/settings_navigation_wgt.dart';
import 'package:flight_booking_app/screens/settings/widgets/settings_profile_header_wgt.dart';
import 'package:flight_booking_app/templates/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(
        repository: inject<UserRepository>(),
        authUser: context.read<AuthCubit>().currentUser!,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 32, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) => SettingsProfileHeaderWidget(
                  title: state.current?.firstName ?? BoneMock.name,
                  subtitle: state.current?.email ?? BoneMock.email,
                  isPending: state.isPending,
                ),
              ),
              const SizedBox(height: 32),
              const SettingsNavigationWidget(
                title: 'Profile details',
                icon: Iconsax.profile_circle_outline,
                route: SettingsProfileRoute(),
              ),
              const Divider(indent: 24, endIndent: 24),
              const SettingsNavigationWidget(
                title: 'Password',
                icon: Iconsax.lock_outline,
              ),
              const Divider(indent: 24, endIndent: 24),
              const SettingsNavigationWidget(
                title: 'Notifications',
                icon: Iconsax.message_notif_outline,
              ),
              const Divider(indent: 24, endIndent: 24),
              const SettingsNavigationWidget(
                title: 'Theme mode',
                icon: Iconsax.moon_outline,
              ),
              const Divider(indent: 24, endIndent: 24),
              const SettingsNavigationWidget(
                title: 'About application',
                icon: Iconsax.info_circle_outline,
              ),
              const Divider(indent: 24, endIndent: 24),
              SettingsNavigationWidget(
                title: 'Logout',
                icon: Iconsax.logout_1_outline,
                showAction: false,
                onTap: context.read<AuthCubit>().logout,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(activeRoute: SettingsRoute()),
    );
  }
}
