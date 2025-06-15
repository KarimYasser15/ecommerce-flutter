import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_response.dart';
import 'package:ecommerce/features/auth/data/models/signup_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepository({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  Future<Either<UserModel, Failure>> login(LoginRequest loginRequest) async {
    try {
      final LoginResponse response =
          await authRemoteDataSource.login(loginRequest);
      await authLocalDataSource.saveToken(response.token);
      return Left(response.user);
    } on AppException catch (error) {
      return Right(Failure(error.message));
    }
  }

  Future<Either<UserModel, Failure>> signup(SignUpRequest signUpRequest) async {
    try {
      final SignUpResponse response =
          await authRemoteDataSource.signUp(signUpRequest);
      await authLocalDataSource.saveToken(response.token);
      return Left(response.user);
    } on AppException catch (error) {
      return Right(Failure(error.message));
    }
  }
}
