import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/auth/domain/models/auth_user.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/models/register_credentials.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthLoading()) {
    if (authRepository.isAuthenticated) {
      emit(Authenticated(authRepository.user!));
    }
    emit(const Unauthenticated());
  }

  @protected
  final AuthRepository authRepository;

  @protected
  final UserRepository userRepository;

  AuthUser? get currentUser => authRepository.user;

  Future<void> login(LoginCredentials credentials) async {
    try {
      emit(const AuthLoading());
      final user = await authRepository.login(credentials);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterCredentials data) async {
    try {
      emit(const AuthLoading());
      final user = await authRepository.register(data);
      await userRepository.create(data.toUserRequest(user.id));
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(const AuthLoading());
      await authRepository.logout();
      emit(const Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}

extension on RegisterCredentials {
  UserRequest toUserRequest(String id) {
    return UserRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: null,
      dateOfBirth: null,
    );
  }
}
