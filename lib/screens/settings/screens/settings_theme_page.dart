import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/cubit/app_theme_cubit.dart';
import 'package:flight_booking_app/templates/selector_item_wgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsThemePage extends StatelessWidget {
  const SettingsThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppThemeCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: SafeArea(
        child: ListView.separated(
          itemCount: ThemeMode.values.length,
          itemBuilder: (context, index) {
            final theme = ThemeMode.values[index];
            return SelectorItemWidget(
              onTap: () => cubit.updateTheme(theme),
              title: theme.label,
              active: cubit.theme == theme,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 4),
        ),
      ),
    );
  }
}

extension on ThemeMode {
  String get label => switch (this) {
        ThemeMode.system => 'Use device theme',
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
      };
}
