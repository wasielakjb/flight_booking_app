import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/mixin/destroy_ref_mixin.dart';
import 'package:flight_booking_app/core/mixin/safe_emit_mixin.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flight_booking_app/core/request/form_request.dart';
import 'package:flight_booking_app/templates/form/model/form_value_change.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

part 'form_cubit_state.dart';

abstract class FormCubit extends Cubit<FormCubitState>
    with BlocDestroyRef, SafeEmit {
  FormCubit(super.initialState) {
    init();
  }

  Json _initialValue = {};
  FormGroup? _formGroup;

  FormGroup get formGroup => _formGroup ?? FormGroup({});

  Future<void> init() async {
    if (this is HydratedMixin) {
      (this as HydratedMixin).hydrate();
    }

    _formGroup = buildForm();
    assert(_formGroup != null, 'Form has not been initialized!');

    _initialValue = _formGroup!.rawValue;
    formGroup.valueChanges
        .takeUntil(destroyRef$)
        .startWith(_formGroup!.value)
        .pairwise()
        .listen(
      (event) {
        onFormValueChanged(
          FormChange(event.nonNulls.toList()),
        );
      },
    );
    emit(state.copyWith(initialized: true));
  }

  @protected
  FormGroup buildForm();

  @protected
  FormRequest mapBeforeSubmit();

  @protected
  Future<dynamic> sendForm(covariant FormRequest request);

  @protected
  void onFormValueChanged(FormChange changes) {}

  @protected
  Future<void> onRequestSucceed(covariant FormRequest request) async {}

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;
  
    // emit(state.copyWith(pending: true));
    try {
      final request = mapBeforeSubmit();
      final response = await sendForm(request);
      print(response);
      // if (response.isSuccess) {
      //   formGroup
      //     ..markAsPristine()
      //     ..markAsUntouched();

      //   await onRequestSucceed(request);
      // }
      // emitSafely(state.withResult(response));
    } catch (err) {
      if (err is TypeError && !kDebugMode) {
        // final result = ResultError<T>(FormIncorrectRequestMapping());
        // emit(state.withResult(result));
        return;
      }
      rethrow;
    }
  }

  void reset() {
    formGroup.reset(value: _initialValue);
    emit(state.copyWith(pending: false));
  }
}
