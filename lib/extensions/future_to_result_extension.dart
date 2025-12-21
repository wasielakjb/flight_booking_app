import 'package:dio/dio.dart';
import 'package:flight_booking_app/core/error/data_error.dart';
import 'package:flight_booking_app/core/models/dio_exception_resolver.dart';
import 'package:flight_booking_app/core/models/result_short.dart';
import 'package:flutter/foundation.dart';

extension FutureToResult<T> on Future<T> {
  Future<Result<T>> asResult() {
    ResultError<T> handleError(Object err) {
      if (err is DioException) {
        final domainError = DioExceptionResolver(err).resolve();
        return ResultError<T>(domainError);
      } else if (err is TypeError) {
        if (kDebugMode) throw err;
        return ResultError<T>(DataErrorNetworkModelParsingFailed());
      } else {
        throw err as Exception;
      }
    }

    return then<Result<T>>(ResultSuccess.new).catchError(handleError);
  }
}
