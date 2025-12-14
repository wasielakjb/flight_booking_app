import 'package:dio/dio.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/http/interceptors/auth_token_interceptor.dart';

const AmadeusHttpClient = 'AmadeusHttpClient';
const RetryHttpClient = 'RetryHttpClient';

void setupInterceptors() {
  inject<Dio>(instanceName: AmadeusHttpClient).interceptors.addAll([
    inject<LogInterceptor>(),
    inject<AuthTokenInterceptor>(),
  ]);

  inject<Dio>(instanceName: RetryHttpClient).interceptors.addAll([
    inject<LogInterceptor>(),
  ]);
}
