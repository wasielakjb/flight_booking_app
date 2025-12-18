import 'package:flight_booking_app/core/models/json.dart';

class FormChange {
  FormChange(List<Json> values)
      : previous = Map.unmodifiable(values.first),
        current = Map.unmodifiable(values.last);

  final Json previous;
  final Json current;

  FormValueChange<T> get<T>(String controlName) {
    final previousVal = previous.recursiveVal(controlName) as T?;
    final currentVal = current.recursiveVal(controlName) as T?;
    return FormValueChange<T>(previousVal, currentVal);
  }
}

class FormValueChange<T> {
  FormValueChange(this.previous, this.current);

  final T? previous;
  final T? current;

  bool get changed => previous != current;
}

extension on Json {
  dynamic recursiveVal(String key) {
    final keys = key.split('.');
    if (keys.any((k) => k.isEmpty)) return null;

    final headKey = keys.first;
    final value = containsKey(headKey) ? this[headKey] : null;

    final isLastKey = keys.length == 1;
    if (isLastKey) return value;

    if (value is Json) {
      final tailKey = keys.skip(1).join('.');
      return value.recursiveVal(tailKey);
    } else {
      return null;
    }
  }
}
