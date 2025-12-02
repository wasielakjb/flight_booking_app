// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:flight_booking_app/app/cubit/app_locale_cubit.dart' as _i533;
import 'package:flight_booking_app/app/cubit/app_theme_cubit.dart' as _i850;
import 'package:flight_booking_app/app/router/app_router.dart' as _i716;
import 'package:flight_booking_app/app/router/guards/auth_guard.dart' as _i859;
import 'package:flight_booking_app/di/app_module.dart' as _i1035;
import 'package:flight_booking_app/features/auth/cubit/auth_cubit.dart'
    as _i999;
import 'package:flight_booking_app/features/auth/data/data_sources/auth_remote_ds.dart'
    as _i204;
import 'package:flight_booking_app/features/auth/domain/repository/auth_repository.dart'
    as _i702;
import 'package:flight_booking_app/features/users/data/data_sources/user_remote_ds.dart'
    as _i364;
import 'package:flight_booking_app/features/users/domain/repository/user_repository.dart'
    as _i74;
import 'package:flight_booking_app/templates/toastr/cubit/toastr_cubit.dart'
    as _i927;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.singletonAsync<_i982.FirebaseApp>(
      () => appModule.firebaseApp,
      preResolve: true,
    );
    gh.singleton<_i850.AppThemeCubit>(() => _i850.AppThemeCubit());
    gh.singleton<_i533.AppLocaleCubit>(() => _i533.AppLocaleCubit());
    gh.singleton<_i204.AuthRemoteDataSource>(
        () => _i204.AuthRemoteDataSource());
    gh.singleton<_i927.ToastrCubit>(() => _i927.ToastrCubit());
    gh.lazySingleton<_i974.FirebaseFirestore>(() => appModule.firestore);
    gh.singleton<_i364.UserRemoteDataSource>(
        () => _i364.UserRemoteDataSource(gh<_i974.FirebaseFirestore>()));
    gh.singleton<_i702.AuthRepository>(
        () => _i702.AuthRepository(remoteDS: gh<_i204.AuthRemoteDataSource>()));
    gh.singleton<_i74.UserRepository>(
        () => _i74.UserRepository(remoteDS: gh<_i364.UserRemoteDataSource>()));
    gh.singleton<_i859.AuthGuard>(
        () => _i859.AuthGuard(gh<_i702.AuthRepository>()));
    gh.singleton<_i999.AuthCubit>(() => _i999.AuthCubit(
          authRepository: gh<_i702.AuthRepository>(),
          userRepository: gh<_i74.UserRepository>(),
        ));
    gh.singleton<_i716.AppRouter>(
        () => _i716.AppRouter(authGuard: gh<_i859.AuthGuard>()));
    return this;
  }
}

class _$AppModule extends _i1035.AppModule {}
