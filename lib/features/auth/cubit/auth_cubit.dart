import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking_app/core/mixin/safe_emit_mixin.dart';
import 'package:flight_booking_app/features/auth/domain/models/auth_status.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/models/register_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> with SafeEmit {
  AuthCubit({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthState()) {
    authRepository.stream.listen((token) {
      emit(state.copyWith(isAuthenticated: token != null));
    });
  }

  @protected
  final AuthRepository authRepository;

  @protected
  final UserRepository userRepository;

  // Future<void> _initialize() async {
  //   if (authRepository.isAuthenticated) {
  //     await userRepository.get(authRepository.userId!);
  //     emitSafely(state.copyWith(status: AuthStatus.authenticated));
  //   }
  // }

  Future<void> login(LoginCredentials credentials) async {
    try {
      emitSafely(state.copyWith(status: AuthStatus.loading));
      final id = await authRepository.login(
        email: credentials.email,
        password: credentials.password,
      );
      await userRepository.get(id);
      emitSafely(state.copyWith(status: AuthStatus.authenticated));
    } on FirebaseAuthException catch (e) {
      emitSafely(state.copyWith(status: AuthStatus.error, errorMsg: e.message));
    }
  }

  Future<void> register(RegisterCredentials data) async {
    try {
      emitSafely(state.copyWith(status: AuthStatus.loading));
      final id = await authRepository.register(
        email: data.email,
        password: data.password,
      );
      await userRepository.create(id, data);
      emitSafely(state.copyWith(status: AuthStatus.authenticated));
    } on FirebaseAuthException catch (e) {
      emitSafely(state.copyWith(status: AuthStatus.error, errorMsg: e.message));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emitSafely(state.copyWith(status: AuthStatus.loading));
      await authRepository.resetPassword(email: email);
      emitSafely(state.copyWith(status: AuthStatus.initial));
    } on FirebaseAuthException catch (e) {
      emitSafely(state.copyWith(status: AuthStatus.error, errorMsg: e.message));
    }
  }

  Future<void> logout() async {
    try {
      emitSafely(state.copyWith(status: AuthStatus.loading));
      await authRepository.logout();
      emitSafely(state.copyWith(status: AuthStatus.unauthenticated));
    } on FirebaseAuthException catch (e) {
      emitSafely(state.copyWith(status: AuthStatus.error, errorMsg: e.message));
    }
  }
}
