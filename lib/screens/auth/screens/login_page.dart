import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flight_booking_app/templates/response_dialog/cubit/response_dialog_cubit.dart';
import 'package:flight_booking_app/templates/response_dialog/models/response_dialog_theme.dart';
import 'package:flight_booking_app/templates/response_dialog/response_dialog_action.dart';
import 'package:flight_booking_app/templates/response_dialog/response_dialog_action_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get formState => _formKey.currentState;
  AuthCubit get cubit => context.read<AuthCubit>();
  ResponseDialogCubit get responseDialog => context.read<ResponseDialogCubit>();

  Future<void> submit() async {
    if (!(formState?.saveAndValidate() ?? false)) return;

    final data = LoginCredentials.fromJson(formState!.instantValue);
    await cubit.login(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) => current is AuthError,
          listener: (context, state) {
            responseDialog.error(
              title: const Text('Failure'),
              subtitle: Text((state as AuthError).message),
              content: [
                ResponseDialogAction(
                  action: context.maybePop,
                  text: 'Back',
                  type: ResponseDialogTheme.error,
                  primary: false,
                ),
                const ResponseDialogActionDivider(),
                ResponseDialogAction(
                  action: () {
                    context.maybePop();
                    submit();
                  },
                  text: 'Try again',
                  type: ResponseDialogTheme.error,
                ),
              ],
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Iconsax.airplane_square_bold,
                      size: 80,
                      color: context.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('F L I G H T   B O O K I N G', style: context.titleLarge),
                  const SizedBox(height: 48),
                  FormTextField(
                    formName: 'email',
                    label: 'Email',
                    placeholder: 'Enter e-mail',
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 18),
                  FormTextField(
                    formName: 'password',
                    label: 'Password',
                    placeholder: 'Enter password',
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const AnyButtonContent.outlinedOrText(
                        text: 'Forgot password',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) => FilledButton(
                      onPressed: state is AuthLoading ? null : submit,
                      child: AnyButtonContent.filled(
                        fullWidth: true,
                        pending: state is AuthLoading,
                        text: 'Login',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: context.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: context.bodyMediumBold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.pushRoute(
                                  const RegisterRoute(),
                                ),
                        ),
                      ],
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
