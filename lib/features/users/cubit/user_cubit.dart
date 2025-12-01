import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    required String userId,
  }) : super(const UserState()) {
    _initialize(userId);
  }

  @protected
  final UserRepository repository;
  
  Future<void> _initialize(String userId) async {
    emit(state.copyWith(status: ResourceStatus.loading));
    final user = await repository.get(userId);
    emit(state.copyWith(status: ResourceStatus.success, current: user));
  }

  Future<void> update(UserRequest request) async {
    try {
      emit(state.copyWith(status: ResourceStatus.loading));
      final user = await repository.update(state.current!.id, request);
      emit(state.copyWith(status: ResourceStatus.success, current: user));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: ResourceStatus.failure, errorMsg: e.message));
    }
  }
}
