import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

mixin DestroyRef<S extends StatefulWidget> on State<S> {
  @protected
  final PublishSubject<void> destroyRef$ = PublishSubject();

  @override
  void dispose() {
    destroyRef$.add(null);
    super.dispose();
  }
}

mixin BlocDestroyRef<S> on BlocBase<S> {
  @protected
  final PublishSubject<void> destroyRef$ = PublishSubject();

  @override
  Future<void> close() async {
    destroyRef$.add(null);
    await super.close();
  }
}
