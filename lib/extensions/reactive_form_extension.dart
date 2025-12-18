import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

extension AbstractControlX<T> on AbstractControl<T> {
  FormControl<T> asFormControl() {
    return this as FormControl<T>;
  }

  FormGroup asFormGroup() {
    return this as FormGroup;
  }

  void patchValueNoticeably(T? value) {
    patchValue(value);
    markAsDirty();
    markAsTouched();
  }

  void resetNoticeably() {
    patchValueNoticeably(null);
  }

  void setEnabled(
    bool enabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (enabled) {
      markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
    } else {
      markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
    }
  }

  void setTouched(
    bool touched, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (touched) {
      markAsTouched(updateParent: updateParent, emitEvent: emitEvent);
    } else {
      markAsUntouched(updateParent: updateParent, emitEvent: emitEvent);
    }
  }
}

extension FormGroupX on FormGroup {
  AbstractControl<T>? maybeControl<T>(String name) {
    return containsX(name) ? controlX<T>(name) : null;
  }

  AbstractControl<T> controlX<T>(String name) {
    return control(name) as AbstractControl<T>;
  }

  T? controlVal<T>(String name) {
    return maybeControl<T>(name)?.value;
  }

  FormArray<T> controlXArray<T>(String name) {
    return control(name) as FormArray<T>;
  }

  List<T?>? arrayVal<T>(String name) {
    return controlXArray<T>(name).value;
  }

  bool containsX(String name) {
    final fragments = name.split('.');
    if (fragments.length == 1) return contains(name);

    try {
      final nameWithoutLastFragment =
          fragments.sublist(0, fragments.length - 1).join('.');
      final fg = control(nameWithoutLastFragment).asFormGroup();
      return fg.contains(fragments.last);
    } on FormControlNotFoundException {
      return false;
    }
  }

  void replaceWith(FormGroup other) {
    clearValidators();
    clearAsyncValidators();

    for (final controlName in controls.keys) {
      if (!other.contains(controlName)) {
        removeControl(controlName);
      }
    }

    for (final controlName in other.controls.keys) {
      if (!contains(controlName)) {
        addAll({controlName: other.control(controlName)});
      }
    }

    setValidators(other.validators);
    setAsyncValidators(other.asyncValidators);
    updateValueAndValidity();
  }
}

abstract class ReactiveFormX {
  static AbstractControl<T> controlOf<T>(
    BuildContext context,
    String controlName,
  ) {
    return (ReactiveForm.of(context)! as FormGroup).control(controlName)
        as AbstractControl<T>;
  }

  static AbstractControl<T>? maybeControlOf<T>(
    BuildContext context,
    String controlName,
  ) {
    return (ReactiveForm.of(context)! as FormGroup).maybeControl(controlName)
        as AbstractControl<T>?;
  }
}
