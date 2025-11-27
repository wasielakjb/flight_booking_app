import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.authRepository);

  final AuthRepository authRepository;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authRepository.isAuthenticated) {
      resolver.next();
    } else {
      router.root.replaceAll([const LoginRoute()]);
    }
  }
}
