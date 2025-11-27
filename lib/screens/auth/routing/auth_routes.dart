import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';

class AuthRoutes {
  static List<AutoRoute> get routes => [
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
          keepHistory: false,
          children: [
            AutoRoute(
              path: 'login',
              initial: true,
              page: LoginRoute.page,
            ),
            AutoRoute(
              path: 'register',
              page: RegisterRoute.page,
            ),
          ],
        ),
      ];
}
