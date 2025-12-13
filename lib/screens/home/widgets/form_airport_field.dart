import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormAirportField extends StatefulWidget {
  FormAirportField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.validator,
  }) : super(key: ValueKey(name));

  final String name;
  final String? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final String? Function(String?)? validator;

  @override
  State<FormAirportField> createState() => _FormAirportFieldState();
}

class _FormAirportFieldState extends State<FormAirportField> {
  bool isFocused = false;

  Widget? get prefixIconBuilder {
    if (widget.prefixIcon == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.prefixIcon, size: 20),
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
      child: FormBuilderField<String>(
        name: widget.name,
        initialValue: widget.initialValue,
        validator: widget.validator,
        builder: (field) => InkWell(
          onTap: () async {
            setState(() => isFocused = true);
            setState(() => isFocused = false);
          },
          child: InputDecorator(
            isEmpty: field.value == null,
            isFocused: isFocused,
            decoration: InputDecoration(
              errorMaxLines: 2,
              errorText: field.errorText,
              hintMaxLines: 1,
              hintText: widget.placeholder,
              prefixIcon: prefixIconBuilder,
              prefixIconConstraints: const BoxConstraints.tightFor(),
            ),
          ),
        ),
      ),
    );
  }
}
