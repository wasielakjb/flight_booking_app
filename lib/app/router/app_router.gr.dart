// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flight_booking_app/app/app.dart' as _i1;
import 'package:flight_booking_app/screens/auth/screens/login_page.dart' as _i5;
import 'package:flight_booking_app/screens/auth/screens/register_page.dart'
    as _i6;
import 'package:flight_booking_app/screens/auth/view/auth_page.dart' as _i2;
import 'package:flight_booking_app/screens/history/view/history_page.dart'
    as _i3;
import 'package:flight_booking_app/screens/home/view/home_page.dart' as _i4;
import 'package:flight_booking_app/screens/settings/screens/settings_profile_page.dart'
    as _i8;
import 'package:flight_booking_app/screens/settings/view/settings_page.dart'
    as _i7;
import 'package:flight_booking_app/screens/tickets/view/tickets_page.dart'
    as _i9;

/// generated route for
/// [_i1.AppViewPage]
class AppViewRoute extends _i10.PageRouteInfo<void> {
  const AppViewRoute({List<_i10.PageRouteInfo>? children})
    : super(AppViewRoute.name, initialChildren: children);

  static const String name = 'AppViewRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppViewPage();
    },
  );
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthPage();
    },
  );
}

/// generated route for
/// [_i3.HistoryPage]
class HistoryRoute extends _i10.PageRouteInfo<void> {
  const HistoryRoute({List<_i10.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.HistoryPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterPage();
    },
  );
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return _i10.WrappedRoute(child: const _i7.SettingsPage());
    },
  );
}

/// generated route for
/// [_i8.SettingsProfilePage]
class SettingsProfileRoute extends _i10.PageRouteInfo<void> {
  const SettingsProfileRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsProfileRoute.name, initialChildren: children);

  static const String name = 'SettingsProfileRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsProfilePage();
    },
  );
}

/// generated route for
/// [_i9.TicketsPage]
class TicketsRoute extends _i10.PageRouteInfo<void> {
  const TicketsRoute({List<_i10.PageRouteInfo>? children})
    : super(TicketsRoute.name, initialChildren: children);

  static const String name = 'TicketsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.TicketsPage();
    },
  );
}
