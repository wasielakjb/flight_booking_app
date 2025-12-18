import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/reactive_form_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef FormControlSuggestion<T> = (String label, T value);
typedef ValidationMsgMap = Map<String, ValidationMessageFunction>;

class ReactiveFormTextField<T extends Object> extends StatelessWidget {
  ReactiveFormTextField({
    required this.formControlName,
    this.placeholder,
    this.prefixIcon,
    this.suggestions = const [],
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const [],
    this.validationMessages,
    this.maxLines = 1,
  }) : super(key: ValueKey(formControlName));

  final String? formControlName;
  final String? placeholder;
  final IconData? prefixIcon;
  final List<FormControlSuggestion<T>> suggestions;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final ValidationMsgMap? validationMessages;
  final int? maxLines;

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
      child: ReactiveTextField<T>(
        formControlName: formControlName,
        validationMessages: validationMessages,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: placeholder,
          errorMaxLines: 2,
          prefixIcon: prefixIcon.let(prefixIconBuilder),
          prefixIconConstraints: const BoxConstraints.tightFor(),
          suffixIcon: ReactiveValueListenableBuilder<T>(
            formControlName: formControlName,
            builder: (context, control, child) {
              final hasValue = control.value is String
                  ? (control.value! as String).isNotEmpty
                  : control.value != null;
              if (!hasValue) return const SizedBox();
              return IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 16,
                icon: const Icon(Icons.close_rounded, size: 18),
                onPressed: control.resetNoticeably,
              );
            },
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        maxLines: maxLines,
      ),
    );
  }
}
