import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flight_booking_app/core/error/data_error.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flutter/material.dart';

@immutable
class DioExceptionResolver {
  const DioExceptionResolver(this.err);

  @protected
  final DioException err;

  DataError resolve() => switch (err.type) {
        DioExceptionType.badResponse => _resolveHttpError(),
        DioExceptionType.connectionError => DataErrorNoConnection(),
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => DataErrorNoConnection(),
        DioExceptionType.cancel => DataErrorBadRequest(),
        DioExceptionType.unknown => _resolveUnknownError(),
        DioExceptionType.badCertificate => throw UnimplementedError(),
      };

  DataError _resolveHttpError() {
    final response = err.response;
    final message = _extractMessage(response?.data);
    return switch (response?.statusCode) {
      400 => DataErrorBadRequest(message),
      401 || 403 => DataErrorNoPermission(),
      404 => DataErrorResourceNotFound(),
      500 || 502 || 503 => DataErrorServerError(),
      _ => DataErrorBadRequest(message),
    };
  }

  DataError _resolveUnknownError() {
    final error = err.error;

    if (error is SocketException) return DataErrorNoConnection();
    if (error is HttpException) return DataErrorServiceUnavailable();
    return DataErrorNetworkModelParsingFailed();
  }

  String? _extractMessage(dynamic data) {
    if (data is Json) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }
    return null;
  }
}
