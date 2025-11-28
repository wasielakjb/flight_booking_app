part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    this.current,
    this.isPending = true,
    this.errorMsg,
  });

  final UserResource? current;
  final bool isPending;
  final String? errorMsg;

  UserState copyWith({
    UserResource? current,
    bool? isPending,
    String? errorMsg,
  }) {
    return UserState(
      current: current ?? this.current,
      isPending: isPending ?? this.isPending,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        current,
        isPending,
        errorMsg,
      ];
}
