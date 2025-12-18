import 'package:equatable/equatable.dart';
import 'package:flight_booking_app/core/models/json.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'push_notifications_state.dart';

@singleton
class PushNotificationsCubit extends HydratedCubit<PushNotificationsState> {
  PushNotificationsCubit()
      : super(
          const PushNotificationsState(
            gateChangeEnabled: false,
            priceDropEnabled: false,
            tripGuardianEnabled: false,
          ),
        ) {
    _setupNotifications();
  }

  @protected
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _setupNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await notificationsPlugin.initialize(initializationSettings);
  }

  NotificationDetails notificationDetails() {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      channelDescription: 'This is the default notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    return const NotificationDetails(android: androidDetails, iOS: iosDetails);
  }

  Future<void> showNotification({int id = 0, String? title, String? body}) async {
    await notificationsPlugin.show(id, title, body, notificationDetails());
  }

  void toggleGateChangeAlert() {
    emit(state.copyWith(gateChangeEnabled: !state.gateChangeEnabled));
  }

  void togglePriceDropAlert() {
    emit(state.copyWith(priceDropEnabled: !state.priceDropEnabled));
  }

  void toggleTripGuardian() {
    emit(state.copyWith(tripGuardianEnabled: !state.tripGuardianEnabled));
  }

  @override
  PushNotificationsState? fromJson(Json json) {
    return PushNotificationsState(
      gateChangeEnabled: json['gateChangeEnabled'] as bool? ?? false,
      priceDropEnabled: json['priceDropEnabled'] as bool? ?? false,
      tripGuardianEnabled: json['tripGuardianEnabled'] as bool? ?? false,
    );
  }

  @override
  Json? toJson(PushNotificationsState state) {
    return {
      'gateChangeEnabled': state.gateChangeEnabled,
      'priceDropEnabled': state.priceDropEnabled,
      'tripGuardianEnabled': state.tripGuardianEnabled,
    };
  }
}
