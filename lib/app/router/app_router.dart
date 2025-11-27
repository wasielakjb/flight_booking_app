import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/app/router/guards/auth_guard.dart';
import 'package:flight_booking_app/screens/auth/routing/auth_routes.dart';
import 'package:flight_booking_app/screens/history/routing/history_routes.dart';
import 'package:flight_booking_app/screens/home/routing/home_routes.dart';
import 'package:flight_booking_app/screens/settings/routing/settings_routes.dart';
import 'package:flight_booking_app/screens/tickets/routing/tickets_routes.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: AppViewRoute.page,
      initial: true,
      guards: [authGuard],
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        ...HomeRoutes.routes,
        ...TicketsRoutes.routes,
        ...HistoryRoutes.routes,
        ...SettingsRoutes.routes,
        RedirectRoute(path: '*', redirectTo: 'home'),
      ],
    ),
    ...AuthRoutes.routes,
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
