import 'package:flight_booking_app/core/error/base_error.dart';

sealed class DataError extends BaseError {
  String? get maybeMessage => this is DataErrorBadRequest
      ? (this as DataErrorBadRequest).apiMessage
      : null;
}

class DataErrorNoConnection extends DataError {}

class DataErrorServiceUnavailable extends DataError {}

class DataErrorServerError extends DataError {}

class DataErrorResourceNotFound extends DataError {}

class DataErrorNoPermission extends DataError {}

class DataErrorBadRequest extends DataError {
  DataErrorBadRequest([this.apiMessage]);

  final String? apiMessage;
}

class DataErrorNetworkModelParsingFailed extends DataError {}
