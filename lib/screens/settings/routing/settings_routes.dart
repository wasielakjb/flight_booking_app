import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';

class SettingsRoutes {
  static List<AutoRoute> get routes => [
        CustomRoute<void>(
          path: 'settings',
          page: SettingsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        AutoRoute(
          path: 'settings-profile',
          page: SettingsProfileRoute.page,
        ),
        AutoRoute(
          path: 'settings-password',
          page: SettingsChangePasswordRoute.page,
        ),
        AutoRoute(
          path: 'settings-notifications',
          page: SettingNotificationsRoute.page,
        ),
        AutoRoute(
          path: 'settings-theme',
          page: SettingsThemeRoute.page,
        ),
        AutoRoute(
          path: 'settings-about',
          page: SettingAboutApplicationRoute.page,
        ),
      ];
}
