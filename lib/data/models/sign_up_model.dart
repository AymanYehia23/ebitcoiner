class SignUPRequestModel {
  String userName;
  String email;
  String password;
  String phone;

  SignUPRequestModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName' : userName,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
