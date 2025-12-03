import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:upgrader/upgrader.dart';

part 'app_info_state.dart';

@singleton
class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit() : super(const AppInfoState.initial()) {
    initialize();
  }

  final Upgrader _upgrader = Upgrader();
  Upgrader get upgrader => _upgrader;

  Future<void> initialize() async {
    await _upgrader.initialize();
    emit(
      state.copyWith(
        appVersion: upgrader.currentInstalledVersion,
        storeVersion: upgrader.currentAppStoreVersion,
      ),
    );
  }
}
