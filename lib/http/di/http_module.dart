import 'package:dio/dio.dart';
import 'package:flight_booking_app/http/di/di.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  final jsonHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  @singleton
  LogInterceptor get logInterceptor => LogInterceptor(
        requestHeader: false,
        responseHeader: false,
      );

  @Named(AmadeusHttpClient)
  @singleton
  Dio get amadeusHttpClient => Dio(
        BaseOptions(
          baseUrl: 'https://test.api.amadeus.com',
          headers: jsonHeaders,
        ),
      );
  
  @Named(RetryHttpClient)
  @singleton
  Dio get retryHttpClient => Dio(
        BaseOptions(
          baseUrl: 'https://test.api.amadeus.com/v1',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );
}
