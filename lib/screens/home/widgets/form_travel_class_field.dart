import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/screens/home/models/travel_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormTravelClassField extends StatelessWidget {
  FormTravelClassField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.validator,
  }) : super(key: ValueKey(name));

  final String name;
  final TravelClass? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final String? Function(TravelClass?)? validator;

  Widget? get prefixIconBuilder {
    if (prefixIcon == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(prefixIcon, size: 20),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.surfaceContainer,
        ),
      ),
      child: FormBuilderField<TravelClass>(
        name: name,
        initialValue: initialValue,
        validator: validator,
        builder: (field) => DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<TravelClass>(
            value: field.value,
            onChanged: (value) => field.didChange(value),
            items: TravelClass.values.map((value) {
              return DropdownMenuItem<TravelClass>(
                value: value,
                child: Text(value.resolveName()),
              );
            }).toList(),
            isExpanded: true,
            style: context.bodyLarge,
            customButton: InputDecorator(
              isEmpty: field.value == null,
              decoration: InputDecoration(
                errorText: field.errorText,
                errorMaxLines: 2,
                hintText: placeholder,
                hintMaxLines: 1,
                suffixIcon: const Icon(Icons.expand_more),
                prefixIcon: prefixIconBuilder,
                prefixIconConstraints: const BoxConstraints.tightFor(),
              ),
              child: field.value?.let((value) => Text(value.resolveName())),
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
            ),
            dropdownStyleData: DropdownStyleData(
              elevation: 2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
