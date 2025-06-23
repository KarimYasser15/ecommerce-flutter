import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignUp {
  final AuthRepository _authRepository;

  SignUp(this._authRepository);

  Future<Either<User, Failure>> call(SignUpRequest signUpRequest) =>
      _authRepository.signup(signUpRequest);
}
