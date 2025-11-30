import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SafeEmit<S> on BlocBase<S> {
  @protected
  void emitSafely(S state) {
    if (!isClosed) {
      emit(state);
    } else if (kDebugMode) {
      debugPrint('$runtimeType: Prevented state emit on closed cubit.');
    }
  }
}
