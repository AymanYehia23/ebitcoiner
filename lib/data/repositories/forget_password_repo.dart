abstract class ForgetPasswordRepo {
  Future<dynamic> postForgetPassword({required String email});

  Future<dynamic> postVerifyCode({required String email, required String code});

  Future<dynamic> postResetPassword(
      {required String newPassword, required String code, required String accessToken});
}
