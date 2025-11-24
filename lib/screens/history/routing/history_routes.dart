import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';

class HistoryRoutes {
  static List<AutoRoute> get routes => [
        CustomRoute<void>(
          path: 'history',
          page: HistoryRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
