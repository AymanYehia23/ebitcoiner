import 'dart:convert';

class SignUPModel {
  String name;
  String email;
  String password;
  String phone;

  SignUPModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name' :name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  String toJson() => json.encode(toMap());
}
