import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/features/users/cubit/user_cubit.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:flight_booking_app/templates/form/form_date_time_field.dart';
import 'package:flight_booking_app/templates/form/form_phone_number_field.dart';
import 'package:flight_booking_app/templates/form/form_profile_image_field.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class SettingsProfilePage extends StatefulWidget {
  const SettingsProfilePage({super.key});

  @override
  State<SettingsProfilePage> createState() => _SettingsProfilePageState();
}

class _SettingsProfilePageState extends State<SettingsProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get formState => _formKey.currentState;
  UserCubit get cubit => context.read<UserCubit>();

  Future<void> submit() async {
    if (!(formState?.saveAndValidate() ?? false)) return;

    final current = cubit.state.current!;
    final data = UserRequest.fromJson({
      'email': current.email,
      ...formState!.instantValue,
    });
    await cubit.update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) => Skeletonizer(
            enabled: state.status.isLoading,
            child: FormBuilder(
              key: _formKey,
              child: Column(
                spacing: 12,
                children: [
                  const FormProfileImageField(
                    formName: 'image',
                  ),
                  const SizedBox(height: 12),
                  FormTextField(
                    initialValue: state.current?.firstName,
                    formName: 'first_name',
                    label: 'First Name',
                    placeholder: 'Enter your first name',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.firstName(),
                    ]),
                  ),
                  FormTextField(
                    initialValue: state.current?.lastName,
                    formName: 'last_name',
                    label: 'Last Name',
                    placeholder: 'Enter your last name',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.lastName(),
                    ]),
                  ),
                  FormDateTimeField(
                    initialValue: state.current?.dateOfBirth,
                    formName: 'date_of_birth',
                    label: 'Date of Birth',
                    placeholder: 'Select your date of birth',
                  ),
                  FormPhoneNumberField(
                    initialValue: state.current?.phone,
                    formName: 'phone_number',
                    label: 'Phone Number',
                    placeholder: 'Enter your phone number',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FilledButton(
            onPressed: submit,
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }
}
