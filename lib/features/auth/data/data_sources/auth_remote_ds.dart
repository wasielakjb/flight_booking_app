import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:flight_booking_app/features/auth/domain/models/access_token.dart';
import 'package:flight_booking_app/http/di/di.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRemoteDataSource {
  AuthRemoteDataSource({
    @Named(RetryHttpClient) required this.unauthenticatedClient,
  });

  final Dio unauthenticatedClient;
  
  @protected
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get stream => firebaseAuth.authStateChanges();

  User? get user => firebaseAuth.currentUser;

  Future<String> login(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  Future<String> register(String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  Future<void> resetPassword(String email) async {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  Future<AccessToken> refreshToken() async {
    return unauthenticatedClient.post<Json>(
      '/security/oauth2/token',
      data: {
        'grant_type': 'client_credentials',
        'client_id': 'EwiBDBGTbiiZ3ysnW5Qe4MntEKgOGCni',
        'client_secret': 'RBLjHbRYXFLqJ6xN',
      },
    ).then((res) => AccessToken.fromJson(res.data!));
  }
}
