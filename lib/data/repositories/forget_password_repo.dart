import '../models/forget_password_model.dart';

abstract class ForgetPasswordRepo {
  Future<dynamic> postForgetPassword({required ForgetPasswordModel forgetPasswordModel});

  Future<dynamic> postVerifyCode({required VerifyCodeModel verifyCodeModel});

  Future<dynamic> postResetPassword(
      {required ResetPasswordModel resetPasswordModel});
}
