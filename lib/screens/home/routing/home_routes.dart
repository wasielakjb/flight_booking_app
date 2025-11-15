import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeRoutes {
  List<AutoRoute> get routes => [
    CustomRoute<void>(
      path: 'home',
      page: HomeRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}
