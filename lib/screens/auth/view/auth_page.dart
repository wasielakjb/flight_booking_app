import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart';
import 'package:flight_booking_app/templates/response_dialog/response_dialog_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        authRepository: inject<AuthRepository>(),
        userRepository: inject<UserRepository>(),
      ),
      child: const ResponseDialogWrapper(
        child: AutoRouter(),
      ),
    );
  }
}
