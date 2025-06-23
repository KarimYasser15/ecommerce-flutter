import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Login {
  final AuthRepository _authRepository;

  Login(this._authRepository);

  Future<Either<User, Failure>> call(LoginRequest loginRequest) =>
      _authRepository.login(loginRequest);
}
