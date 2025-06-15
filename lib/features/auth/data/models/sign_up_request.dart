class SignUpRequest {
  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
  String email;
  String password;
  String name;
  String phone;
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'rePassword': password,
      'phone': phone,
    };
  }
}
