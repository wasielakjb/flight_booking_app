import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/cubit/app_locale_cubit.dart';
import 'package:flight_booking_app/app/cubit/app_theme_cubit.dart';
import 'package:flight_booking_app/app/router/app_router.dart';
import 'package:flight_booking_app/di.dart';
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flight_booking_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  App({super.key});

  final router = inject<AppRouter>();
  final authRepository = inject<AuthRepository>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<AppLocaleCubit>()),
        BlocProvider(create: (_) => inject<AppThemeCubit>()),
        BlocProvider(create: (_) => inject<AuthCubit>()),
      ],
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, theme) => BlocBuilder<AppLocaleCubit, Locale>(
          builder: (context, locale) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: theme,
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerConfig: router.config(
              navigatorObservers: () => [AutoRouteObserver()],
              reevaluateListenable: ReevaluateListenable.stream(
                authRepository.stream.map((user) => user != null),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class AppViewPage extends StatelessWidget {
  const AppViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
