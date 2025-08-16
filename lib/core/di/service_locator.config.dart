// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i350;
import 'package:ecommerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart'
    as _i718;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_api_remote_data_source.dart'
    as _i283;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i1063;
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart'
    as _i638;
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart'
    as _i583;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i658;
import 'package:ecommerce/features/auth/domain/use_cases/sign_up.dart' as _i283;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/home/data/data_source/home_api_data_source.dart'
    as _i1005;
import 'package:ecommerce/features/home/data/data_source/home_remote_data_source.dart'
    as _i592;
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart'
    as _i25;
import 'package:ecommerce/features/home/domain/repository/home_repository.dart'
    as _i142;
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart'
    as _i533;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i669;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPrefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i350.AuthLocalDataSource>(() =>
        _i718.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.singleton<_i1063.AuthRemoteDataSource>(
        () => _i283.AuthApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i592.HomeRemoteDataSource>(
        () => _i1005.HomeApiDataSource(gh<_i361.Dio>()));
    gh.singleton<_i583.AuthRepository>(() => _i638.AuthRepositoryImpl(
          gh<_i1063.AuthRemoteDataSource>(),
          gh<_i350.AuthLocalDataSource>(),
        ));
    gh.singleton<_i658.Login>(() => _i658.Login(gh<_i583.AuthRepository>()));
    gh.singleton<_i283.SignUp>(() => _i283.SignUp(gh<_i583.AuthRepository>()));
    gh.lazySingleton<_i142.HomeRepository>(
        () => _i25.HomeRepositoryImpl(gh<_i592.HomeRemoteDataSource>()));
    gh.lazySingleton<_i533.GetCategories>(
        () => _i533.GetCategories(gh<_i142.HomeRepository>()));
    gh.singleton<AuthCubit>(() => AuthCubit(
          gh<_i658.Login>(),
          gh<_i283.SignUp>(),
        ));
    gh.lazySingleton<_i669.HomeCubit>(
        () => _i669.HomeCubit(gh<_i533.GetCategories>()));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
