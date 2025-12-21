import 'package:flight_booking_app/core/error/base_error.dart';
import 'package:flight_booking_app/core/models/result.dart' as r;

typedef Result<T> = r.Result<T, BaseError>;

typedef ResultSuccess<T> = r.ResultSuccess<T, BaseError>;

typedef ResultError<T> = r.ResultError<T, BaseError>;
