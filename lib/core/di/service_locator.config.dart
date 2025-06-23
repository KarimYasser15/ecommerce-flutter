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
import 'package:ecommerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart';
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
    gh.singleton<_i1063.AuthRemoteDataSource>(
        () => _i283.AuthApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i350.AuthLocalDataSource>(
        () => AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.singleton<_i583.AuthRepository>(() => _i638.AuthRepositoryImpl(
          gh<_i1063.AuthRemoteDataSource>(),
          gh<_i350.AuthLocalDataSource>(),
        ));
    gh.singleton<_i658.Login>(() => _i658.Login(gh<_i583.AuthRepository>()));
    gh.singleton<_i283.SignUp>(() => _i283.SignUp(gh<_i583.AuthRepository>()));
    gh.singleton<AuthCubit>(() => AuthCubit(
          gh<_i658.Login>(),
          gh<_i283.SignUp>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
