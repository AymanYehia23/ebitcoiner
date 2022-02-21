import 'dart:convert';

class SignUPModel {
  String email;
  String password;
  String phone;

  SignUPModel({
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
    };
  }

  String toJson() => json.encode(toMap());
}
