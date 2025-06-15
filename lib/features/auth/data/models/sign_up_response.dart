import 'package:ecommerce/features/auth/data/models/user_model.dart';

class SignUpResponse {
  String message;
  UserModel user;
  String token;

  SignUpResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }
}
