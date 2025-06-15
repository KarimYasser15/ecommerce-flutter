import 'package:ecommerce/features/auth/data/models/user_model.dart';

class LoginResponse {
  String message;
  UserModel user;
  String token;

  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String,
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String,
      );
}
