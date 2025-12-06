import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/phone_prefix_selector_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormPhoneNumberField extends StatelessWidget {
  FormPhoneNumberField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.allowCountryCodeChange = true,
    this.validator,
  }) : super(key: ValueKey(name));

  final String name;
  final String? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final bool allowCountryCodeChange;
  final String? Function(String?)? validator;

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
        name: name,
        validator: validator,
        initialValue: initialValue,
        builder: (field) => PhoneNumberField(
          initialValue: field.value,
          onChanged: field.didChange,
          allowCountryCodeChange: allowCountryCodeChange,
          placeholder: placeholder,
          prefixIcon: prefixIcon,
          errorText: field.errorText,
        ),
      ),
    );
  }
}

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    required this.initialValue,
    required this.onChanged,
    this.onSubmitted,
    this.allowCountryCodeChange = true,
    this.placeholder,
    this.prefixIcon,
    this.errorText,
    super.key,
  });

  final String? initialValue;
  final void Function(String?) onChanged;
  final void Function()? onSubmitted;
  final bool allowCountryCodeChange;
  final String? placeholder;
  final IconData? prefixIcon;
  final String? errorText;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  late TextEditingController _controller;
  late CountryWithPhoneCode countryCode;
  final _focusNode = FocusNode();

  String? get phoneNumber => _controller.text.isNotEmpty
      ? '+${countryCode.phoneCode}${_controller.text.replaceAll(' ', '')}'
      : null;

  @override
  void initState() {
    super.initState();
    countryCode = CountryWithPhoneCode.getCountryDataByPhone(
      widget.initialValue ?? '+48',
    )!;

    _controller = TextEditingController(
      text: widget.initialValue != null
          ? formatNumberSync(
              widget.initialValue!,
              country: countryCode,
              inputContainsCountryCode: false,
            )
          : '',
    );

    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      isFocused: _focusNode.hasFocus,
      decoration: InputDecoration(errorText: widget.errorText),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(widget.prefixIcon, size: 20),
            const SizedBox(width: 8),
            const VerticalDivider(),
            const SizedBox(width: 8),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
              ),
              onPressed: () async {
                if (!widget.allowCountryCodeChange) return;
                final res = await PhonePrefixSelectorSheet.show(
                  context,
                  countryCode,
                );
                if (res != null) {
                  setState(() => countryCode = res);
                }
              },
              child: Row(
                children: [
                  Text('+${countryCode.phoneCode}', style: context.bodyLarge),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 16,
                    color: context.onSurface,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LibPhonenumberTextFormatter(country: countryCode),
                ],
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.placeholder,
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onChanged: (_) => widget.onChanged.call(phoneNumber),
                onSubmitted: (_) => widget.onSubmitted?.call(),
                onTapOutside: (_) => _focusNode.unfocus(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
