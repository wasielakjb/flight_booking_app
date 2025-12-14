import 'dart:async';

import 'package:flight_booking_app/features/auth/domain/models/access_token.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class AuthLocalDataSource {
  AuthLocalDataSource({required this.storage});

  final Storage storage;

  static const storageId = 'AuthBloc';
  static const accessTokenKey = 'accessToken';

  final _controller = BehaviorSubject<AccessToken?>();

  AccessToken? get token => _controller.value;
  Stream<AccessToken?> get stream => _controller.stream.asBroadcastStream();

  Future<void> init() async {
    return _controller.sink.add(token);
  }

  FutureOr<AccessToken?> read() async {
    if (_controller.hasValue) return token;

    final value = await storage.read(storageId);
    final json = (value as Map?)?.cast<String, dynamic>();

    if (json != null && json[accessTokenKey] != null) {
      return AccessToken.fromJson(
        (json[accessTokenKey] as Map).cast<String, dynamic>(),
      );
    }
    return null;
  }

  Future<void> save(AccessToken token) async {
    final json = {accessTokenKey: token.toJson()};
    await storage.write(storageId, json);
    _controller.sink.add(token);
  }

  Future<void> delete() async {
    await storage.delete(storageId);
    _controller.sink.add(null);
  }
}
