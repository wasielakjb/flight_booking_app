part of 'app_info_cubit.dart';

class AppInfoState extends Equatable {
  const AppInfoState({
    required this.appVersion,
    required this.storeVersion,
  });

  const AppInfoState.initial() : this(
    appVersion: null,
    storeVersion: null,
  );

  final String? appVersion;
  final String? storeVersion;

  AppInfoState copyWith({
    String? appVersion,
    String? storeVersion,
  }) {
    return AppInfoState(
      appVersion: appVersion ?? this.appVersion,
      storeVersion: storeVersion ?? this.storeVersion,
    );
  }

  @override
  List<Object?> get props => [
    appVersion,
    storeVersion,
  ];
}
