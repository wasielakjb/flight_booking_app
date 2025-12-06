import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flight_booking_app/templates/toastr/models/app_toastr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  FormBuilderState? get formState => _formKey.currentState;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status.isError) {
          AppToastr.error(context, state.errorMsg!);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: context.headlineLarge,
                      ),
                      Text(
                        'Enter your email address to get the password reset link.',
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  FormTextField(
                    name: 'email',
                    placeholder: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                    validator: FormBuilderValidators.email(),
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () async {
                      if (!(formState?.saveAndValidate() ?? false)) return;
                      final cubit = context.read<AuthCubit>();
                      await cubit.resetPassword(
                        formState!.instantValue['email'] as String,
                      );
                      if (!context.mounted) return;
                      AppToastr.success(context, 'Password reset email was send.');
                      await context.maybePop();
                    },
                    child: AnyButtonContent.filled(
                      text: 'Password reset',
                      fullWidth: true,
                      pending: state.status.isLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
