import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.repository,
  }) : super(const UserState());

  @protected
  final UserRepository repository;
}
