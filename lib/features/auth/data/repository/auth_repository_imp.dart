import 'package:flight_booking_app/features/auth/data/data_sources/auth_local_ds.dart';
import 'package:flight_booking_app/features/auth/data/data_sources/auth_remote_ds.dart';
import 'package:flight_booking_app/features/auth/domain/models/access_token.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp({
    required this.localDS,
    required this.remoteDS,
  });

  @protected
  final AuthLocalDataSource localDS;

  @protected
  final AuthRemoteDataSource remoteDS;

  final _refreshingToken = BehaviorSubject.seeded(false);

  @override
  Stream<AccessToken?> get stream => localDS.stream;

  @override
  Stream<String?> get userStream => remoteDS.stream
      .map((user) => user?.uid)
      .distinct((prev, next) => prev == next);

  @override
  bool get isAuthenticated => remoteDS.user != null;

  @override
  Future<AccessToken> getValidToken() async {
    final isTokenRefreshInProgress = _refreshingToken.value;
    if (isTokenRefreshInProgress) {
      await _refreshingToken.firstWhere((refreshing) => !refreshing);
    }

    final token = await localDS.read();
    return token == null || token.isExpired
        ? await _refreshToken()
        : token;
  }

  @override
  Future<String> login({required String email, required String password}) {
    return remoteDS.login(email, password);
  }

  @override
  Future<void> logout() {
    return remoteDS.logout();
  }

  @override
  Future<String> register({required String email, required String password}) {
    return remoteDS.register(email, password);
  }

  @override
  Future<void> resetPassword({required String email}) {
    return remoteDS.resetPassword(email);
  }

  Future<AccessToken> _refreshToken() async {
    _refreshingToken.add(true);
    final token = await remoteDS.refreshToken();
    await localDS.save(token);
    _refreshingToken.add(false);
    return token;
  }
}
