part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({this.resource});

  final UserResource? resource;

  UserState copyWith({UserResource? resource}) =>
      UserState(resource: resource ?? this.resource);

  @override
  List<Object?> get props => [resource];
}
