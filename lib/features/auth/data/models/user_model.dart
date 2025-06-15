class UserModel {
  String? name;
  String? email;
  String? role;

  UserModel({this.name, this.email, this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
      };
}
