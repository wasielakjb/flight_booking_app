import 'package:flight_booking_app/app/app.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/http/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart'
    as lib_phone_number;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getApplicationSupportDirectory()).path),
  );

  await configureDependencies();
  setupInterceptors();
  await lib_phone_number.init();

  runApp(App());
}
