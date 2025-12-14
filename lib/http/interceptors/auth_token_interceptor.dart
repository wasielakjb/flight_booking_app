import 'package:dio/dio.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flight_booking_app/http/di/di.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthTokenInterceptor extends QueuedInterceptor {
  AuthTokenInterceptor({
    @Named(RetryHttpClient) required this.retryHttpClient,
    required this.authRepo,
  });

  final Dio retryHttpClient;
  final AuthRepository authRepo;

  static const Authorization = 'Authorization';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await authRepo.getValidToken();
    options.headers[Authorization] = token.requestToken;
    handler.next(options);
  }
}
