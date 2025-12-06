import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormDateTimeField extends StatelessWidget {
  FormDateTimeField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.inputType = InputType.date,
    this.format,
    this.keyboardType = TextInputType.datetime,
    this.inputFormatters = const [],
    this.validator,
  }) : super(key: ValueKey(name));

  final String name;
  final DateTime? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final InputType inputType;
  final DateFormat? format;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(DateTime?)? validator;

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
      child: FormBuilderDateTimePicker(
        name: name,
        initialValue: initialValue,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: placeholder,
          errorMaxLines: 2,
          prefixIcon: prefixIconBuilder,
          prefixIconConstraints: const BoxConstraints.tightFor(),
          // prefixIcon: prefixIcon != null
          //     ? Padding(
          //         padding: const EdgeInsets.fromLTRB(14, 12.5, 8, 12.5),
          //         child: IntrinsicHeight(
          //           child: Row(
          //             spacing: 8,
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Icon(prefixIcon, size: 20),
          //               const VerticalDivider(),
          //             ],
          //           ),
          //         ),
          //       )
          //     : null,
        ),
        inputType: inputType,
        format: format ?? DateFormat('dd MMM yyyy'),
        keyboardType: keyboardType,
        valueTransformer: (value) => value?.toIso8601String(),
      ),
    );
  }
}
