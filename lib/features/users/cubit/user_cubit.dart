import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/auth/domain/models/auth_user.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.repository,
    required AuthUser authUser,
  }) : super(const UserState()) {
    _init(authUser.id);
  }

  @protected
  final UserRepository repository;

  Future<void> _init(String id) async {
    try {
      final user = await repository.get(id);
      emit(state.copyWith(current: user, isPending: false));
    } catch (e) {
      emit(state.copyWith(isPending: false, errorMsg: e.toString()));
    }
  }
}
