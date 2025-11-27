import 'package:flight_booking_app/app/app.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart'
    as lib_phone_number;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await lib_phone_number.init();

  runApp(App());
}
