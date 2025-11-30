import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/features/users/cubit/user_cubit.dart';
import 'package:flight_booking_app/features/users/domain/models/user_request.dart';
import 'package:flight_booking_app/templates/response_dialog/cubit/response_dialog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  ResponseDialogCubit get dialog => context.read<ResponseDialogCubit>();

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
     return const Scaffold();
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Edit Profile')),
    //   body: BlocListener<UserCubit, UserState>(
    //     listener: (context, state) => switch (state.status) {
    //       ResourceStatus.success => dialog.success(title: const Text('Success')),
    //       ResourceStatus.failure => dialog.error(
    //           title: const Text('Failure'),
    //           subtitle: Text(state.errorMsg!),
    //         ),
    //       _ => null,
    //     },
    //     child: SingleChildScrollView(
    //       padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
    //       child: BlocBuilder<UserCubit, UserState>(
    //         builder: (context, state) => Skeletonizer(
    //           enabled: state.status.isLoading,
    //           child: FormBuilder(
    //             key: _formKey,
    //             child: Column(
    //               spacing: 12,
    //               children: [
    //                 const FormProfileImageField(
    //                   formName: 'image',
    //                 ),
    //                 const SizedBox(height: 12),
    //                 FormTextField(
    //                   initialValue: state.current?.firstName,
    //                   name: 'first_name',
    //                   label: 'First Name',
    //                   placeholder: 'Enter your first name',
    //                   validator: FormBuilderValidators.compose([
    //                     FormBuilderValidators.required(),
    //                     FormBuilderValidators.firstName(),
    //                   ]),
    //                 ),
    //                 FormTextField(
    //                   initialValue: state.current?.lastName,
    //                   name: 'last_name',
    //                   label: 'Last Name',
    //                   placeholder: 'Enter your last name',
    //                   validator: FormBuilderValidators.compose([
    //                     FormBuilderValidators.required(),
    //                     FormBuilderValidators.lastName(),
    //                   ]),
    //                 ),
    //                 FormDateTimeField(
    //                   initialValue: state.current?.dateOfBirth,
    //                   name: 'date_of_birth',
    //                   label: 'Date of Birth',
    //                   placeholder: 'Select your date of birth',
    //                 ),
    //                 FormPhoneNumberField(
    //                   initialValue: state.current?.phone,
    //                   name: 'phone',
    //                   label: 'Phone Number',
    //                   placeholder: 'Enter your phone number',
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBar: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 24),
    //       child: FilledButton(
    //         onPressed: submit,
    //         child: const Text('Save'),
    //       ),
    //     ),
    //   ),
    // );
  
  }
}
