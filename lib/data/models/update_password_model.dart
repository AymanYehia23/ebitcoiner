class UpdatePasswordModel {
  String password;
  String newPassword;

  UpdatePasswordModel({required this.password, required this.newPassword});

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'newPassword': newPassword,
    };
  }
}
