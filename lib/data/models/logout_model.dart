class LogoutModel {
  String? refreshToken;
  LogoutModel({
    this.refreshToken,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'token': refreshToken,
    };
  }
}
