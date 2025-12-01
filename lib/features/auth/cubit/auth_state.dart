part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userId,
    this.status = AuthStatus.initial,
    this.errorMsg,
  });

  final String? userId;
  final AuthStatus status;
  final String? errorMsg;

  AuthState copyWith({
    String? userId,
    AuthStatus? status,
    String? errorMsg,
  }) {
    return AuthState(
      userId: userId ?? this.userId,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        status,
        errorMsg,
      ];
}
