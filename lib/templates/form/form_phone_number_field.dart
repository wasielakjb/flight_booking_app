import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/phone_prefix_selector_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class FormPhoneNumberField extends StatelessWidget {
  FormPhoneNumberField({
    required this.formName,
    this.label,
    this.placeholder,
    this.allowCountryCodeChange = true,
    this.validator,
  }) : super(key: ValueKey(formName));

  final String formName;
  final String? label;
  final String? placeholder;
  final bool allowCountryCodeChange;
  final String? Function(String?)? validator;

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
        FormBuilderField<String>(
          name: formName,
          validator: validator,
          builder: (field) => PhoneNumberField(
            initialValue: field.value,
            onChanged: field.didChange,
            allowCountryCodeChange: allowCountryCodeChange,
            placeholder: placeholder,
          ),
        ),
      ],
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
    super.key,
  });

  final String? initialValue;
  final void Function(String?) onChanged;
  final void Function()? onSubmitted;
  final bool allowCountryCodeChange;
  final String? placeholder;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  late CountryWithPhoneCode countryCode;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    countryCode = CountryWithPhoneCode.getCountryDataByPhone(widget.initialValue ?? '+48')!;
    _focusNode.addListener(() => setState(() {}));
  }

  TextEditingController? get controller {
    if (widget.initialValue == null) return null;
    final formatted = formatNumberSync(
      widget.initialValue!,
      country: countryCode,
      inputContainsCountryCode: false,
    );
    return TextEditingController()
      ..value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
  }

  String? get phoneNumber => controller?.value != null
      ? '+${countryCode.phoneCode} ${controller!.value.text}'
      : null;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      isFocused: _focusNode.hasFocus,
      decoration: const InputDecoration(),
      child: IntrinsicHeight(
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
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
                spacing: 4,
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
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: TextField(
                controller: controller,
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
                onChanged: (value) => widget.onChanged.call(phoneNumber),
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
