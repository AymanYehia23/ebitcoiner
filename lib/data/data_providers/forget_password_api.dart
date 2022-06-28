import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/http/http_service.dart';
import 'package:ebitcoiner/data/repositories/forget_password_repo.dart';

import '../models/forget_password_model.dart';

class ForgetPasswordApi implements ForgetPasswordRepo {
  @override
  Future<dynamic> postForgetPassword(
      {required ForgetPasswordModel forgetPasswordModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.forgetPasswordEndPoint,
      data: forgetPasswordModel.toMap(),
    ).then((value) => value.data);
  }

  @override
  Future<dynamic> postVerifyCode(
      {required VerifyCodeModel verifyCodeModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.verifyCodeEndPoint,
      data: verifyCodeModel.toMap(),
    ).then((value) => value.data);
  }

  @override
  Future<dynamic> postResetPassword(
      {required ResetPasswordModel resetPasswordModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.resetPasswordEndPoint,
      data: resetPasswordModel.toMap(),
    ).then((value) => value.data);
  }
}
