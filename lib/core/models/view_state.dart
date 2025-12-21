import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/error/base_error.dart';

sealed class ViewState<T> {
  const ViewState();

  bool get isError => this is ViewStateError;

  bool get isPending => this is ViewStatePending;

  bool get isLoaded => this is ViewStateLoaded;

  T? get maybeValue =>
      (this is ViewStateLoaded) ? (this as ViewStateLoaded).state as T : null;

  BaseError? get maybeError =>
      (this is ViewStateError<T>) ? (this as ViewStateError<T>).error : null;

  ViewState<T>? maybeApply(
    T Function(T) transform, {
    T? initial,
  }) {
    if (this is! ViewStateLoaded) {
      if (initial != null) return ViewStateLoaded(initial);
      return null;
    }
    final value = (this as ViewStateLoaded).state as T;
    return ViewStateLoaded(transform(value));
  }
}

class ViewStateError<T> extends ViewState<T> {
  const ViewStateError([this.error]);

  final BaseError? error;
}

class ViewStatePending<T> extends ViewState<T> {
  const ViewStatePending();
}

class ViewStateLoaded<T> extends ViewState<T> with EquatableMixin {
  const ViewStateLoaded(this.state);

  final T state;

  @override
  List<Object?> get props => [state];
}
