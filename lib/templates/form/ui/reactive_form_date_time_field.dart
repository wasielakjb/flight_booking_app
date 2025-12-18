import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/form/ui/reactive_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReactiveFormDateTimeField extends StatelessWidget {
  ReactiveFormDateTimeField({
    required this.formControlName,
    this.placeholder,
    this.prefixIcon,
    this.validationMessages,
  }) : super(key: ValueKey(formControlName));

  final String? formControlName;
  final String? placeholder;
  final IconData? prefixIcon;
  final ValidationMsgMap? validationMessages;

  Widget prefixIconBuilder(IconData icon) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20),
              const VerticalDivider(),
            ],
          ),
        ),
      );

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
      child: ReactiveDateTimePicker(
        formControlName: formControlName,
        validationMessages: validationMessages,
        decoration: InputDecoration(
          hintText: placeholder,
          hintMaxLines: 1,
          errorMaxLines: 2,
          prefixIcon: prefixIcon?.let(prefixIconBuilder),
          prefixIconConstraints: const BoxConstraints.tightFor(),
        ),
        style: context.bodyLarge.copyWith(overflow: TextOverflow.ellipsis),
        dateFormat: DateFormat('dd MMM yyyy'),
        getInitialDate: (fieldValue, lastDate) => fieldValue ?? DateTime.now(),
        datePickerEntryMode: DatePickerEntryMode.calendarOnly,
        showClearIcon: false,
      ),
    );
  }
}
