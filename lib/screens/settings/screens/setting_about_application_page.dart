import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/cubit/app_info/app_info_cubit.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/screens/settings/widgets/settings_navigation_wgt.dart';
import 'package:flight_booking_app/templates/app_logo_wgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

@RoutePage()
class SettingAboutApplicationPage extends StatelessWidget {
  const SettingAboutApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppInfoCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About application'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
        children: [
          const AppLogoWidget(),
          const SizedBox(height: 48),
          Text(
            'The FLIGHT BOOKING application is your complete travel management center for all things flight-related. It is intuitive, fast, and designed for convenience. Among other features, it allows you to quickly search and compare flights, track the status of your reservations in real-time, and generate detailed boarding passes directly on your device.',
            style: context.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: 'Installed version: ',
              style: context.bodyMedium,
              children: [
                TextSpan(
                  text: cubit.appVersion ?? '-',
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              text: 'Store version: ',
              style: context.bodyMedium,
              children: [
                TextSpan(
                  text: cubit.storeVersion ?? '-',
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SettingsNavigationWidget(
            onTap: () => context.router.pushWidget(
              const LicensePage(applicationIcon: AppLogoWidget()),
            ),
            title: 'Open source licenses',
            icon: Iconsax.document_outline,
            padding: const EdgeInsets.all(8),
            backgroundColor: context.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
