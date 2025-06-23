import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_response.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);
  Future<LoginResponse> login(LoginRequest loginRequest);
}
