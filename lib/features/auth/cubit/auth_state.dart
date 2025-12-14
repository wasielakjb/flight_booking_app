part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMsg,
    this.isAuthenticated = false,
  });

  final AuthStatus status;
  final String? errorMsg;
  final bool isAuthenticated;

  AuthState copyWith({
    AuthStatus? status,
    String? errorMsg,
    bool? isAuthenticated,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMsg,
        isAuthenticated,
      ];
}
