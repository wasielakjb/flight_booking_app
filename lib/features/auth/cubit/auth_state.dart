part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class Authenticated extends AuthState with EquatableMixin {
  const Authenticated(this.user);
  final AuthUser user;

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthError extends AuthState with EquatableMixin {
  const AuthError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
