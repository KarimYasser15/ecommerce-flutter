import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<User, Failure>> login(LoginRequest loginRequest);

  Future<Either<User, Failure>> signup(SignUpRequest signUpRequest);
}
