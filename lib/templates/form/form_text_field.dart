import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef SuffixBuilderCallback = Widget Function(
  BuildContext context,
  FormBuilderFieldState<FormBuilderTextField, String> control,
);

class FormTextField extends StatefulWidget {
  FormTextField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const [],
    this.validator,
    this.maxLines = 1,
    this.suffixBuilder,
    this.onTap,
    this.onTapOutside,
  }) : super(key: ValueKey(name));

  final String name;
  final String? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLines;
  final SuffixBuilderCallback? suffixBuilder;
  final VoidCallback? onTap;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  final ValueNotifier<String?> text = ValueNotifier<String?>(null);
  final control = FormBuilderFieldState<FormBuilderTextField, String>();

  Widget? get suffixIconBuilder {
    if (widget.suffixBuilder == null) return null;
    return ValueListenableBuilder<String?>(
      valueListenable: text,
      builder: (context, value, child) =>
          widget.suffixBuilder!.call(context, control),
    );
  }

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
      child: FormBuilderTextField(
        name: widget.name,
        initialValue: widget.initialValue,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          errorMaxLines: 2,
          suffixIcon: suffixIconBuilder,
          prefixIcon: prefixIconBuilder,
          prefixIconConstraints: const BoxConstraints.tightFor(),
        ),
        obscureText: widget.obscureText,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        onTapOutside: (value) {
          widget.onTapOutside?.call(value);
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
