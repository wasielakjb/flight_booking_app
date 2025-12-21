// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flight_booking_app/app/app.dart' as _i1;
import 'package:flight_booking_app/features/users/cubit/user_cubit.dart'
    as _i19;
import 'package:flight_booking_app/screens/auth/screens/forgot_password_page.dart'
    as _i4;
import 'package:flight_booking_app/screens/auth/screens/login_page.dart' as _i7;
import 'package:flight_booking_app/screens/auth/screens/register_page.dart'
    as _i8;
import 'package:flight_booking_app/screens/auth/view/auth_page.dart' as _i2;
import 'package:flight_booking_app/screens/history/view/history_page.dart'
    as _i5;
import 'package:flight_booking_app/screens/home/screens/flights_form/cubit/flights_form_cubit.dart'
    as _i17;
import 'package:flight_booking_app/screens/home/screens/flights_result/view/flights_result_page.dart'
    as _i3;
import 'package:flight_booking_app/screens/home/view/home_page.dart' as _i6;
import 'package:flight_booking_app/screens/settings/screens/setting_about_application_page.dart'
    as _i9;
import 'package:flight_booking_app/screens/settings/screens/setting_notifications_page.dart'
    as _i10;
import 'package:flight_booking_app/screens/settings/screens/settings_change_password_page.dart'
    as _i11;
import 'package:flight_booking_app/screens/settings/screens/settings_profile_page.dart'
    as _i13;
import 'package:flight_booking_app/screens/settings/screens/settings_theme_page.dart'
    as _i14;
import 'package:flight_booking_app/screens/settings/view/settings_page.dart'
    as _i12;
import 'package:flight_booking_app/screens/tickets/view/tickets_page.dart'
    as _i15;
import 'package:flutter/material.dart' as _i18;

/// generated route for
/// [_i1.AppViewPage]
class AppViewRoute extends _i16.PageRouteInfo<void> {
  const AppViewRoute({List<_i16.PageRouteInfo>? children})
    : super(AppViewRoute.name, initialChildren: children);

  static const String name = 'AppViewRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppViewPage();
    },
  );
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute({List<_i16.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthPage();
    },
  );
}

/// generated route for
/// [_i3.FlightsResultPage]
class FlightsResultRoute extends _i16.PageRouteInfo<FlightsResultRouteArgs> {
  FlightsResultRoute({
    required _i17.FlightsFormCubit cubit,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         FlightsResultRoute.name,
         args: FlightsResultRouteArgs(cubit: cubit, key: key),
         initialChildren: children,
       );

  static const String name = 'FlightsResultRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlightsResultRouteArgs>();
      return _i3.FlightsResultPage(cubit: args.cubit, key: args.key);
    },
  );
}

class FlightsResultRouteArgs {
  const FlightsResultRouteArgs({required this.cubit, this.key});

  final _i17.FlightsFormCubit cubit;

  final _i18.Key? key;

  @override
  String toString() {
    return 'FlightsResultRouteArgs{cubit: $cubit, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FlightsResultRouteArgs) return false;
    return cubit == other.cubit && key == other.key;
  }

  @override
  int get hashCode => cubit.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i16.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i5.HistoryPage]
class HistoryRoute extends _i16.PageRouteInfo<void> {
  const HistoryRoute({List<_i16.PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HistoryPage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return _i16.WrappedRoute(child: const _i6.HomePage());
    },
  );
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.RegisterPage();
    },
  );
}

/// generated route for
/// [_i9.SettingAboutApplicationPage]
class SettingAboutApplicationRoute extends _i16.PageRouteInfo<void> {
  const SettingAboutApplicationRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingAboutApplicationRoute.name, initialChildren: children);

  static const String name = 'SettingAboutApplicationRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.SettingAboutApplicationPage();
    },
  );
}

/// generated route for
/// [_i10.SettingNotificationsPage]
class SettingNotificationsRoute extends _i16.PageRouteInfo<void> {
  const SettingNotificationsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingNotificationsRoute.name, initialChildren: children);

  static const String name = 'SettingNotificationsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingNotificationsPage();
    },
  );
}

/// generated route for
/// [_i11.SettingsChangePasswordPage]
class SettingsChangePasswordRoute extends _i16.PageRouteInfo<void> {
  const SettingsChangePasswordRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsChangePasswordRoute.name, initialChildren: children);

  static const String name = 'SettingsChangePasswordRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return _i16.WrappedRoute(child: const _i12.SettingsPage());
    },
  );
}

/// generated route for
/// [_i13.SettingsProfilePage]
class SettingsProfileRoute
    extends _i16.PageRouteInfo<SettingsProfileRouteArgs> {
  SettingsProfileRoute({
    required _i19.UserCubit userCubit,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         SettingsProfileRoute.name,
         args: SettingsProfileRouteArgs(userCubit: userCubit, key: key),
         initialChildren: children,
       );

  static const String name = 'SettingsProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsProfileRouteArgs>();
      return _i16.WrappedRoute(
        child: _i13.SettingsProfilePage(
          userCubit: args.userCubit,
          key: args.key,
        ),
      );
    },
  );
}

class SettingsProfileRouteArgs {
  const SettingsProfileRouteArgs({required this.userCubit, this.key});

  final _i19.UserCubit userCubit;

  final _i18.Key? key;

  @override
  String toString() {
    return 'SettingsProfileRouteArgs{userCubit: $userCubit, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsProfileRouteArgs) return false;
    return userCubit == other.userCubit && key == other.key;
  }

  @override
  int get hashCode => userCubit.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i14.SettingsThemePage]
class SettingsThemeRoute extends _i16.PageRouteInfo<void> {
  const SettingsThemeRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsThemeRoute.name, initialChildren: children);

  static const String name = 'SettingsThemeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsThemePage();
    },
  );
}

/// generated route for
/// [_i15.TicketsPage]
class TicketsRoute extends _i16.PageRouteInfo<void> {
  const TicketsRoute({List<_i16.PageRouteInfo>? children})
    : super(TicketsRoute.name, initialChildren: children);

  static const String name = 'TicketsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.TicketsPage();
    },
  );
}
