import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
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
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
