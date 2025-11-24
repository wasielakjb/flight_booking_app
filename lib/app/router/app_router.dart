import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/screens/history/routing/history_routes.dart';
import 'package:flight_booking_app/screens/home/routing/home_routes.dart';
import 'package:flight_booking_app/screens/settings/routing/settings_routes.dart';
import 'package:flight_booking_app/screens/tickets/routing/tickets_routes.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: AppViewRoute.page,
      initial: true,
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        ...HomeRoutes.routes,
        ...TicketsRoutes.routes,
        ...HistoryRoutes.routes,
        ...SettingsRoutes.routes,
        RedirectRoute(path: '*', redirectTo: 'home'),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
