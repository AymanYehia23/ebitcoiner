class DeleteAccountModel {
  String password;
  String? refreshToken;
  DeleteAccountModel({
    required this.password,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'token': refreshToken,
    };
  }
}
