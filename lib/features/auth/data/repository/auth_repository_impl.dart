import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mapper.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_response.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  const AuthRepositoryImpl(
    this._authRemoteDataSource,
    this._authLocalDataSource,
  );
  @override
  Future<Either<User, Failure>> login(LoginRequest loginRequest) async {
    try {
      final LoginResponse response =
          await _authRemoteDataSource.login(loginRequest);
      await _authLocalDataSource.saveToken(response.token);
      return Left(response.user.toEntity);
    } on AppException catch (error) {
      return Right(Failure(error.message));
    }
  }

  @override
  Future<Either<User, Failure>> signup(SignUpRequest signUpRequest) async {
    try {
      final SignUpResponse response =
          await _authRemoteDataSource.signUp(signUpRequest);
      await _authLocalDataSource.saveToken(response.token);
      return Left(response.user.toEntity);
    } on AppException catch (error) {
      return Right(Failure(error.message));
    }
  }
}
