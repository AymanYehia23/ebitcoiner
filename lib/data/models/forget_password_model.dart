class ForgetPasswordModel {
  String email;
  ForgetPasswordModel({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }
}

class VerifyCodeModel {
  String email;
  String code;
  VerifyCodeModel({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'code': code,
    };
  }
}

class ResetPasswordModel {
  String newPassword;
  String code;
  String accessToken;
  ResetPasswordModel({
    required this.newPassword,
    required this.code,
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'newPassword': newPassword,
      'code': code,
    };
  }
}
