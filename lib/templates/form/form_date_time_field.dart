import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormDateTimeField extends StatelessWidget {
  FormDateTimeField({
    required this.name,
    this.initialValue,
    this.label,
    this.validator,
    this.placeholder,
    this.inputFormatters = const [],
    this.suffix,
  }) : super(key: ValueKey(name));

  final String name;
  final DateTime? initialValue;
  final String? label;
  final String? Function(DateTime?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final String? placeholder;
  final Widget? suffix;

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
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: context.bodySmall.copyWith(
                color: context.onSurface.withValues(alpha: 0.8),
              ),
            ),
          FormBuilderDateTimePicker(
            name: name,
            initialValue: initialValue,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: placeholder,
              errorMaxLines: 2,
              suffix: suffix,
            ),
            inputType: InputType.date,
            format: DateFormat('dd MMM yyyy'),
            keyboardType: TextInputType.datetime,
            valueTransformer: (value) => value?.toIso8601String(),
          ),
        ],
      ),
    );
  }
}
