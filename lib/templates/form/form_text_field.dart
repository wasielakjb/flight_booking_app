import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
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
    this.label,
    this.validator,
    this.placeholder,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.suffix,
    this.suffixBuilder,
    this.onTapOutside,
  }) : super(key: ValueKey(name));

  final String name;
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
  final SuffixBuilderCallback? suffixBuilder;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  final ValueNotifier<String?> text = ValueNotifier<String?>(null);
  final control = FormBuilderFieldState<FormBuilderTextField, String>();


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
          if (widget.label != null)
            Text(
              widget.label!,
              style: context.bodySmall.copyWith(
                color: context.onSurface.withValues(alpha: 0.8),
              ),
            ),
          FormBuilderTextField(
            name: widget.name,
            initialValue: widget.initialValue,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              errorMaxLines: 2,
              suffixIcon: ValueListenableBuilder<String?>(
                valueListenable: text,
                builder: (context, value, child) {
                  if (widget.suffixBuilder == null) return const SizedBox();
                  return widget.suffixBuilder!.call(context, control);
                },
              ),
            ),
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            onTapOutside: (value) {
              widget.onTapOutside?.call(value);
              FocusScope.of(context).unfocus();
            },
            maxLines: widget.maxLines,
          ),
        ],
      ),
    );
  }
}
