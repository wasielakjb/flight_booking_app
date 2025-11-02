import 'package:flight_booking_app/app/app.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(App());
}
