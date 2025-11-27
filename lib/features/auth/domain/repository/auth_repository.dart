import 'package:flight_booking_app/features/auth/data/data_sources/auth_remote_ds.dart';
import 'package:flight_booking_app/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:flight_booking_app/features/auth/domain/models/auth_user.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  AuthRepository({required this.remoteDS});

  @protected
  final AuthRemoteDataSource remoteDS;

  AuthUser? get user => remoteDS.user?.asAuthUser();

  bool get isAuthenticated => remoteDS.user != null;

  Stream<AuthUser?> get stream =>
      remoteDS.stream.map((user) => user?.asAuthUser())
          .distinct((prev, next) => prev?.id == next?.id);

  Future<AuthUser> login(LoginCredentials payload) async {
    return remoteDS
        .login(payload.email, payload.password)
        .then((res) => res.user!.asAuthUser());
  }

  Future<void> signOut() async {
    await remoteDS.signOut();
  }
}
