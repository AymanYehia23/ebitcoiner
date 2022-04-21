import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/repositories/forget_password_repo.dart';

class ForgetPasswordApi implements ForgetPasswordRepo {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Strings.baseUrl,
      queryParameters: {'key': Strings.apiKey},
    ),
  );

  @override
  Future<dynamic> postForgetPassword({required String email}) async {
    return await dio.post(Strings.forgetPasswordEndPoint, data: {
      'email': email,
    }).then((value) => value.data);
  }

  @override
  Future<dynamic> postVerifyCode(
      {required String email, required String code}) async {
    return await dio.post(Strings.verifyCodeEndPoint, data: {
      'email': email,
      'code': code,
    }).then((value) => value.data);
  }

  @override
  Future<dynamic> postResetPassword(
      {required String newPassword,
      required String code,
      required String accessToken}) async {
    return await dio
        .post(
          Strings.resetPasswordEndPoint,
          data: {
            'newPassword': newPassword,
            'code': code,
          },
          options: Options(
            headers: {'Authorization': 'Bearer $accessToken'},
          ),
        )
        .then((value) => value.data);
  }
}
