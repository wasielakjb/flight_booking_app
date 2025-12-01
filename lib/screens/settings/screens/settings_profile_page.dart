import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/features/users/cubit/user_cubit.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/form/form_date_time_field.dart';
import 'package:flight_booking_app/templates/form/form_phone_number_field.dart';
import 'package:flight_booking_app/templates/form/form_profile_image_field.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flight_booking_app/templates/toastr/models/app_toastr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class SettingsProfilePage extends StatefulWidget implements AutoRouteWrapper{
  const SettingsProfilePage({required this.userCubit, super.key});

  final UserCubit userCubit;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: userCubit,
      child: this,
    );
  }

  @override
  State<SettingsProfilePage> createState() => _SettingsProfilePageState();
}

class _SettingsProfilePageState extends State<SettingsProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  FormBuilderState? get formState => _formKey.currentState;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          AppToastr.error(context, state.errorMsg!);
        }

        if (state.status.isSuccess) {
          AppToastr.success(context, 'Profile updated successfully');
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Edit Profile')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Skeletonizer(
              enabled: state.status.isLoading,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    FormProfileImageField(name: 'image'),
                    const SizedBox(height: 16),
                    FormTextField(
                      initialValue: state.current?.fullName,
                      name: 'full_name',
                      label: 'Full name',
                      placeholder: 'Enter your full name',
                      validator: FormBuilderValidators.required(),
                    ),
                    FormDateTimeField(
                      initialValue: state.current?.birthOfDate,
                      name: 'birth_of_date',
                      label: 'Birth of date',
                      placeholder: 'Select your birth of date',
                      validator: FormBuilderValidators.required(),
                    ),
                    FormPhoneNumberField(
                      initialValue: state.current?.phoneNumer,
                      name: 'phone_numer',
                      label: 'Phone Number',
                      placeholder: 'Enter your phone number',
                      validator: FormBuilderValidators.required(),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () async {
                        if (!(formState?.saveAndValidate() ?? false)) return;

                        final request =
                            UserRequest.fromJson(formState!.instantValue);
                        final cubit = context.read<UserCubit>();
                        await cubit.update(request);
                      },
                      child: AnyButtonContent.filled(
                        text: 'Save',
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
      ),
    );
  }
}
