import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/auth/domain/models/login_credentials.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/divider_wgt.dart';
import 'package:flight_booking_app/templates/form/form_password_field.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flight_booking_app/templates/toastr/models/app_toastr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        'Sign in to your Account',
                        style: context.headlineLarge,
                      ),
                      Text(
                        'Enter your email and password to log in',
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FormTextField(
                        name: 'email',
                        label: 'Email',
                        placeholder: 'Enter your email',
                        validator: FormBuilderValidators.email(),
                      ),
                      FormPasswordField(
                        name: 'password',
                        label: 'Password',
                        placeholder: 'Enter your Password',
                        validator: FormBuilderValidators.required(),
                      ),
                      GestureDetector(
                        onTap: () => context.pushRoute(
                          const ForgotPasswordRoute(),
                        ),
                        child: Text(
                          'Forgot Password ?',
                          style: context.bodySmallBold.copyWith(
                            color: context.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: FilledButton(
                      onPressed: () async {
                        if (!(formState?.saveAndValidate() ?? false)) return;
                        final cubit = context.read<AuthCubit>();
                        await cubit.login(
                          LoginCredentials.fromJson(formState!.instantValue),
                        );
                      },
                      child: AnyButtonContent.filled(
                        text: 'Log In',
                        fullWidth: true,
                        pending: state.status.isLoading,
                      ),
                    ),
                  ),
                  Column(
                    spacing: 16,
                    children: [
                      const DividerWidget(label: 'Or'),
                      OutlinedButton(
                        onPressed: () {},
                        child: AnyButtonContent.filled(
                          text: 'Continue with Google',
                          icon: SvgPicture.asset(
                            'assets/icons/google.svg',
                            width: 18,
                            height: 18,
                          ),
                          fullWidth: true,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: AnyButtonContent.filled(
                          text: 'Continue with Apple',
                          icon: SvgPicture.asset(
                            'assets/icons/apple.svg',
                            width: 18,
                            height: 18,
                          ),
                          fullWidth: true,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Don’t have an account?',
                        style: context.bodySmall,
                        children: [
                          const WidgetSpan(child: SizedBox(width: 5)),
                          TextSpan(
                            text: 'Sign Up',
                            style: context.bodySmallBold
                                .copyWith(color: context.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  context.pushRoute(const RegisterRoute()),
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
