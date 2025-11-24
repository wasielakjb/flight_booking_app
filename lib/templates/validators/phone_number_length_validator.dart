import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class PhoneNumberLengthValidator {
  static bool isValid(String number) {
    final targetPhoneLength = CountryWithPhoneCode.getCountryDataByPhone(number)
        ?.exampleNumberMobileInternational
        .replaceAll(' ', '')
        .length;
    return targetPhoneLength == number.length;
  }

  /// [FormFieldValidator] that requires the phone number to have valid length.
  static FormFieldValidator<T> validator<T>({
    required String errorText,
  }) {
    return (T? valueCandidate) {
      assert(valueCandidate is String?, 'String? is required');

      final number = valueCandidate as String?;

      if (number != null && PhoneNumberLengthValidator.isValid(number)) {
        return null;
      }
      return errorText;
    };
  }
}
