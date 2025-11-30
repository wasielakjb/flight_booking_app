import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRemoteDataSource {
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

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
