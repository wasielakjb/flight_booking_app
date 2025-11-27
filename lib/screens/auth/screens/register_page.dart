import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/auth/domain/models/register_credentials.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get formState => _formKey.currentState;
  AuthCubit get cubit => context.read<AuthCubit>();

  Future<void> submit() async {
    if (!(formState?.saveAndValidate() ?? false)) return;

    final data = RegisterCredentials.fromJson(formState!.instantValue);
    await cubit.register(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
                  formName: 'first_name',
                  label: 'First name',
                  placeholder: 'Enter first name',
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.firstName(),
                  ]),
                ),
                const SizedBox(height: 8),
                FormTextField(
                  formName: 'last_name',
                  label: 'Last name',
                  placeholder: 'Enter last name',
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.lastName(),
                  ]),
                ),
                const SizedBox(height: 8),
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
                const SizedBox(height: 8),
                FormTextField(
                  formName: 'password',
                  label: 'Password',
                  placeholder: 'Enter password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: submit,
                  child:  const AnyButtonContent.filled(
                    fullWidth: true,
                    // pending: cubit.state.isPending,
                    text: 'Create account ',
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: context.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: context.bodyMediumBold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = context.maybePop,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
