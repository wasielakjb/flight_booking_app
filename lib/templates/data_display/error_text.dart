import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.text, {
    this.style,
    this.textAlign,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  const ErrorText.margin(
    this.text, {
    this.style,
    this.textAlign,
    super.key,
  }) : padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: (style ?? context.bodySmall).copyWith(color: context.error),
        textAlign: textAlign,
      ),
    );
  }
}
