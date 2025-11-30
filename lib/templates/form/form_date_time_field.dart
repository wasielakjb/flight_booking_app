import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
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
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.suffix,
  }) : super(key: ValueKey(name));

  final String name;
  final DateTime? initialValue;
  final String? label;
  final String? Function(DateTime?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final String? placeholder;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLines;

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
            initialDate: initialValue,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: placeholder,
              errorMaxLines: 2,
              suffix: suffix,
            ),
            inputType: InputType.date,
            format: DateFormat('dd MMM yyyy'),
            valueTransformer: (value) => value.let(DateFormat('dd MMM yyyy').format),
            obscureText: obscureText,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
