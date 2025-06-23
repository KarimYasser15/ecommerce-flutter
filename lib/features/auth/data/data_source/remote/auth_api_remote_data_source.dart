import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_request.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  const AuthApiRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? errorMessage;
      if (exception is DioException) {
        errorMessage = exception.response?.data['message'];
      }
      throw RemoteException(errorMessage ?? "Failed to login");
    }
  }

  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.signUpEndPoint,
        data: signUpRequest.toJson(),
      );
      return SignUpResponse.fromJson(response.data);
    } catch (exception) {
      String? errorMessage;
      if (exception is DioException) {
        errorMessage = exception.response?.data['message'];
      }
      throw RemoteException(errorMessage ?? "Failed to sign up");
    }
  }
}
