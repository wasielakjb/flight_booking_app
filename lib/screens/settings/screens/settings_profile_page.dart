import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/templates/form/form_phone_number_field.dart';
import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';

@RoutePage()
class SettingsProfilePage extends StatelessWidget {
  const SettingsProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: FormBuilder(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: context.primary,
                      ),
                      child: CircleAvatar(
                        radius: 62,
                        backgroundColor: context.surfaceContainerHighest,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: context.primary,
                      ),
                      child: Icon(
                        Iconsax.edit_2_bold,
                        size: 18,
                        color: context.surface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              FormTextField(
                formName: 'first_name',
                label: 'First Name',
                placeholder: 'Enter your first name',
                validator: FormBuilderValidators.required(),
              ),
              FormTextField(
                formName: 'last_name',
                label: 'Last Name',
                placeholder: 'Enter your last name',
                validator: FormBuilderValidators.required(),
              ),
              FormTextField(
                formName: 'date_of_birth',
                label: 'Date of Birth',
                placeholder: 'Select your date of birth',
                validator: FormBuilderValidators.required(),
              ),
              FormPhoneNumberField(
                formName: 'phone_number',
                label: 'Phone Number',
                placeholder: 'Enter your phone number',
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
