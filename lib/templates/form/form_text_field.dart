import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormTextField extends StatelessWidget {
  FormTextField({
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
    this.onTapOutside,
  }) : super(key: ValueKey(formName));

  final String formName;
  final String? initialValue;
  final String? label;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final String? placeholder;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final void Function(PointerDownEvent)? onTapOutside;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
              child: Text(label!, style: context.labelLarge),
            ),
          FormBuilderTextField(
            name: formName,
            initialValue: initialValue,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: placeholder,
              errorMaxLines: 2,
              suffix: suffix,
            ),
            obscureText: obscureText,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            onTapOutside: (value) {
              onTapOutside?.call(value);
              FocusScope.of(context).unfocus();
            },
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
