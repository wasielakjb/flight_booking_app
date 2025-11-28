import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/resource_status.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.repository,
    required String id,
  }) : super(const UserState()) {
    _init(id);
  }

  @protected
  final UserRepository repository;

  Future<void> _init(String id) async {
    try {
      emit(state.copyWith(status: ResourceStatus.loading));
      final user = await repository.get(id);
      emit(state.copyWith(status: ResourceStatus.success, current: user));
    } catch (e) {
      emit(
        state.copyWith(status: ResourceStatus.failure, errorMsg: e.toString()),
      );
    }
  }

  Future<void> update(UserRequest request) async {
    try {
      emit(state.copyWith(status: ResourceStatus.loading));
      final user = await repository.update(state.current!.id, request);
      emit(state.copyWith(status: ResourceStatus.success, current: user));
    } catch (e) {
      emit(state.copyWith(status: ResourceStatus.failure, errorMsg: e.toString()));
    }
  }
}
