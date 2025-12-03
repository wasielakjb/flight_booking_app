import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/templates/toggle_item_wgt.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingNotificationsPage extends StatelessWidget {
  const SettingNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      body: ListView(
        children: [
          ToggleItemWidget(
            title: const Text('Gate Change Alert'),
            subtitle: const Text('Get real-time updates on delays and gate changes.'),
            value: false,
            onChanged: (value) {},
          ),
          ToggleItemWidget(
            title: const Text('Price Drop Alert'),
            subtitle: const Text('We notify you when the price of your tracked flights drops.'),
            value: false,
            onChanged: (value) {},
          ),
          ToggleItemWidget(
            title: const Text('Trip Guardian'),
            subtitle: const Text('All your check-in and flight status reminders in one place.'),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
