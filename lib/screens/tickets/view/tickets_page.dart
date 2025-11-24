import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/templates/app_navigation_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('TicketsPage'),
      ),
      bottomNavigationBar: AppNavigationBar(activeRoute: TicketsRoute()),
    );
  }
}
