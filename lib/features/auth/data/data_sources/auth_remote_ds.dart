import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRemoteDataSource {
  @protected
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get stream => firebaseAuth.authStateChanges();

  User? get user => firebaseAuth.currentUser;

  Future<UserCredential> login(String email, String password) async {
    return firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register(String email, String password) async {
    return firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
