import 'package:flight_booking_app/features/auth/data/data_sources/auth_remote_ds.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/models/register_credentials.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  AuthRepository({required this.remoteDS});

  @protected
  final AuthRemoteDataSource remoteDS;

  String? get userId => remoteDS.user?.uid;

  bool get isAuthenticated => remoteDS.user != null;

  Stream<String?> get stream => remoteDS.stream
      .map((user) => user?.uid)
      .distinct((prev, next) => prev == next);

  Future<String> login(LoginCredentials payload) async {
    return remoteDS.login(payload.email, payload.password);
  }

  Future<String> register(RegisterCredentials payload) async {
    return remoteDS.register(payload.email, payload.password);
  }

  Future<void> resetPassword(String email) async {
    return remoteDS.resetPassword(email);
  }

  Future<void> logout() async {
    await remoteDS.logout();
  }
}
