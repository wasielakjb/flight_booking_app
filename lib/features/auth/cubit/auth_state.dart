part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMsg,
  });

  final AuthStatus status;
  final String? errorMsg;

  AuthState copyWith({
    AuthStatus? status,
    String? errorMsg,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMsg,
      ];
}
