import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/screens/home/routing/home_routes.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {

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
        ...inject<HomeRoutes>().routes,
        RedirectRoute(path: '*', redirectTo: 'home'),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
