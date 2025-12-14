import 'package:flight_booking_app/features/auth/domain/models/access_token.dart';

abstract interface class AuthRepository {
  Stream<AccessToken?> get stream;

  Stream<String?> get userStream;

  bool get isAuthenticated;

  Future<AccessToken> getValidToken();

  Future<String> login({required String email, required String password});

  Future<void> logout();
  
  Future<String> register({required String email, required String password});

  Future<void> resetPassword({required String email});
}
