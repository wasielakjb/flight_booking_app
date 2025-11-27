import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/extensions/json.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
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

  Future<void> create(Json json) async {
    final request = UserRequest(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: 'wasielakjb@gmail.com',
      phone: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
    );
    await repository.create(request);
  }
}
