import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FormDateTimeField extends StatelessWidget {
  FormDateTimeField({
    required this.formName,
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
  }) : super(key: ValueKey(formName));

  final String formName;
  final String? initialValue;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
            child: Text(label!, style: context.labelLarge),
          ),
        FormBuilderDateTimePicker(
          name: formName,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: placeholder,
            errorMaxLines: 2,
            suffix: suffix,
          ),
          inputType: InputType.date,
          format: DateFormat('dd MMM yyyy'),
          obscureText: obscureText,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
