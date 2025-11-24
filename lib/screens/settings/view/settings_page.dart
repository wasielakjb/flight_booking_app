import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/screens/settings/widgets/settings_navigation_wgt.dart';
import 'package:flight_booking_app/screens/settings/widgets/settings_profile_header_wgt.dart';
import 'package:flight_booking_app/templates/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsProfileHeaderWidget(
                title: 'John Snow',
                subtitle: 'john.snow@example.com',
              ),
              SizedBox(height: 32),
              SettingsNavigationWidget(
                title: 'Profile details',
                icon: Iconsax.profile_circle_outline,
                route: SettingsProfileRoute(),
              ),
              Divider(indent: 24, endIndent: 24),
              SettingsNavigationWidget(
                title: 'Password',
                icon: Iconsax.lock_outline,
              ),
              Divider(indent: 24, endIndent: 24),
              SettingsNavigationWidget(
                title: 'Notifications',
                icon: Iconsax.message_notif_outline,
              ),
              Divider(indent: 24, endIndent: 24),
              SettingsNavigationWidget(
                title: 'Theme mode',
                icon: Iconsax.moon_outline,
              ),
              Divider(indent: 24, endIndent: 24),
              SettingsNavigationWidget(
                title: 'About application',
                icon: Iconsax.info_circle_outline,
              ),
              Divider(indent: 24, endIndent: 24),
              SettingsNavigationWidget(
                title: 'Logout',
                icon: Iconsax.logout_1_outline,
                showAction: false,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavigationBar(activeRoute: SettingsRoute()),
    );
  }
}
