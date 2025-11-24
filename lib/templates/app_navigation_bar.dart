import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({
    required this.activeRoute,
    super.key,
  });

  final PageRouteInfo<dynamic> activeRoute;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  List<PageRouteInfo<dynamic>> routes = const [
    HomeRoute(),
    TicketsRoute(),
    HistoryRoute(),
    SettingsRoute(),
  ];

  int get activeRoute => routes.contains(widget.activeRoute)
      ? routes.indexOf(widget.activeRoute)
      : throw Exception('Cannot find ${widget.activeRoute} in _routes');

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: NavigationBar(
        selectedIndex: activeRoute,
        onDestinationSelected: (value) => context.router.pushAndPopUntil(
          routes[value],
          predicate: (route) => route.data?.name == HomeRoute.name,
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home_1_outline),
            selectedIcon: Icon(Iconsax.home_1_bold),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.ticket_outline),
            selectedIcon: Icon(Iconsax.ticket_bold),
            label: 'Tickets',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.document_text_1_outline),
            selectedIcon: Icon(Iconsax.document_text_1_bold),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.setting_outline),
            selectedIcon: Icon(Iconsax.setting_bold),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
