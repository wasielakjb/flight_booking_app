import 'package:flight_booking_app/templates/form/form_text_field.dart';
import 'package:flutter/material.dart';

class FormPasswordField extends StatefulWidget {
  FormPasswordField({
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
  State<FormPasswordField> createState() => _FormPasswordFieldState();
}

class _FormPasswordFieldState extends State<FormPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      name: widget.name,
      initialValue: widget.initialValue,
      prefixIcon: widget.prefixIcon,
      placeholder: widget.placeholder,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      suffixBuilder: (context, _) => IconButton(
        onPressed: () => setState(() => obscureText = !obscureText),
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          size: 18,
        ),
      ),
    );
  }
}
