import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/auth/domain/models/auth_user.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/models/register_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(const AuthLoading()){
    if (authRepository.isAuthenticated) {
      emit(Authenticated(authRepository.user!));
    }
    emit(const Unauthenticated());
  }

  @protected
  final AuthRepository authRepository;

  Future<void> login(LoginCredentials credentials) async {
    try {
      emit(const AuthLoading());
      final user = await authRepository.login(credentials);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(const AuthLoading());
      await authRepository.signOut();
      emit(const Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterCredentials data) async {}
}
