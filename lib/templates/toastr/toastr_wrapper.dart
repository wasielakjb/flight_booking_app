import 'package:flight_booking_app/templates/toastr/cubit/toastr_cubit.dart';
import 'package:flight_booking_app/templates/toastr/models/app_toastr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToastrWrapper extends StatelessWidget {
  const ToastrWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToastrCubit, ToastrState>(
      listener: (context, state) => AppToastr.show(
        context,
        state.message,
        title: state.title,
        type: state.type,
      ),
      child: child,
    );
  }
}
