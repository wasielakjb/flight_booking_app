import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/auth/domain/models/register_credentials.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/form_date_time_field.dart';
import 'package:flight_booking_app/templates/form/form_password_field.dart';
import 'package:flight_booking_app/templates/form/form_phone_number_field.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flight_booking_app/templates/toastr/models/app_toastr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
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
                        'Sign up',
                        style: context.headlineLarge,
                      ),
                      Text(
                        'Create an account to continue!',
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTextField(
                        name: 'full_name',
                        placeholder: 'Enter your full name',
                        prefixIcon: Icons.person_outline,
                        validator: FormBuilderValidators.required(),
                      ),
                      FormTextField(
                        name: 'email',
                        placeholder: 'Enter your email',
                        prefixIcon: Icons.email_outlined,
                        validator: FormBuilderValidators.email(),
                      ),
                      FormDateTimeField(
                        name: 'birth_of_date',
                        placeholder: 'Select your birth of date',
                        prefixIcon: Icons.date_range_outlined,
                        validator: FormBuilderValidators.dateTime(),
                      ),
                      FormPhoneNumberField(
                        name: 'phone_numer',
                        placeholder: 'Enter your phone number',
                        prefixIcon: Icons.phone_outlined,
                        validator: FormBuilderValidators.phoneNumber(),
                      ),
                      FormPasswordField(
                        name: 'password',
                        placeholder: 'Set your Password',
                        prefixIcon: Icons.lock_outline,
                        validator: FormBuilderValidators.required(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () async {
                      if (!(formState?.saveAndValidate() ?? false)) return;
                      final cubit = context.read<AuthCubit>();
                      await cubit.register(
                        RegisterCredentials.fromJson(formState!.instantValue),
                      );
                    },
                    child: AnyButtonContent.filled(
                      text: 'Register',
                      fullWidth: true,
                      pending: state.status.isLoading,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: context.bodySmall,
                        children: [
                          const WidgetSpan(child: SizedBox(width: 5)),
                          TextSpan(
                            text: 'Login',
                            style: context.bodySmallBold
                                .copyWith(color: context.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = context.maybePop,
                          ),
                        ],
                      ),
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
