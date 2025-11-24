import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';

class TicketsRoutes {
  static List<AutoRoute> get routes => [
        CustomRoute<void>(
          path: 'tickets',
          page: TicketsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
