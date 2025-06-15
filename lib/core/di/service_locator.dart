import 'package:ecommerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repository/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton(
    AuthCubit(
      AuthRepository(
        authRemoteDataSource: AuthApiRemoteDataSource(),
        authLocalDataSource: AuthSharedPrefLocalDataSource(),
      ),
    ),
  );
}
