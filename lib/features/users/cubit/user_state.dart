part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    this.current,
    this.errorMsg,
    this.status = ResourceStatus.initial,
  });

  final UserResource? current;
  final ResourceStatus status;
  final String? errorMsg;

  UserState copyWith({
    UserResource? current,
    ResourceStatus? status,
    String? errorMsg,
  }) {
    return UserState(
      current: current ?? this.current,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
        current,
        status,
        errorMsg,
      ];
}
