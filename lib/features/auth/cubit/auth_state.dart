part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.user,
    this.status = AuthStatus.initial,
    this.errorMsg,
  });

  final UserResource? user;
  final AuthStatus status;
  final String? errorMsg;

  AuthState copyWith({
    UserResource? user,
    AuthStatus? status,
    String? errorMsg,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        user,
        status,
        errorMsg,
      ];
}
