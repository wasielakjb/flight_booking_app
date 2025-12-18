import 'package:flight_booking_app/core/error/base_error.dart';

sealed class Result<T, E extends BaseError> {
  ResultSuccess<T, E>? get maybeSuccess =>
      this is ResultSuccess<T, E> ? this as ResultSuccess<T, E> : null;

  ResultError<T, E>? get maybeError =>
      this is ResultError<T, E> ? this as ResultError<T, E> : null;

  bool get isError => maybeError != null;

  bool get isSuccess => maybeSuccess != null;
}

class ResultSuccess<T, E extends BaseError> extends Result<T, E> {
  ResultSuccess(this.data);

  final T data;
}

class ResultError<T, E extends BaseError> extends Result<T, E> {
  ResultError(this.error);

  final E error;
}
