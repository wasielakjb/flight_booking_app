import 'package:flight_booking_app/templates/response_dialog/cubit/response_dialog_cubit.dart';
import 'package:flight_booking_app/templates/response_dialog/response_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseDialogWrapper extends StatelessWidget {
  const ResponseDialogWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResponseDialogCubit, ResponseDialogState>(
      listener: (context, state) async {
        await ResponseDialog.show(
          context: context,
          title: state.title,
          subtitle: state.subtitle,
          iconData: state.iconData,
          type: state.type,
          content: state.content,
        );
      },
      child: child,
    );
  }
}
