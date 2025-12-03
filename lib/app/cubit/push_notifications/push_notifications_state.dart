part of 'push_notifications_cubit.dart';

class PushNotificationsState extends Equatable {
  const PushNotificationsState({
    required this.gateChangeEnabled,
    required this.priceDropEnabled,
    required this.tripGuardianEnabled,
  });

  final bool gateChangeEnabled;
  final bool priceDropEnabled;
  final bool tripGuardianEnabled;

  PushNotificationsState copyWith({
    bool? gateChangeEnabled,
    bool? priceDropEnabled,
    bool? tripGuardianEnabled,
  }){
    return PushNotificationsState(
      gateChangeEnabled: gateChangeEnabled ?? this.gateChangeEnabled, 
      priceDropEnabled: priceDropEnabled ?? this.priceDropEnabled,
      tripGuardianEnabled: tripGuardianEnabled ?? this.tripGuardianEnabled,
    );
  }

  @override
  List<Object?> get props => [
        gateChangeEnabled,
        priceDropEnabled,
        tripGuardianEnabled,
      ];
}
