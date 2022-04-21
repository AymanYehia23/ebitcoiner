import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/repositories/login_repo.dart';

class LoginApi implements LoginRepo {
  @override
  Future<dynamic> fPostLogin(
      {required String userName, required String password}) async {
    return await HttpService.postRequest(
        endPoint: Strings.fLoginEndPoint,
        data: {'userName': userName, 'password': password}).then(
      (value) {
        return value.data;
      },
    );
  }

  @override
  Future<dynamic> sPostLogin(
      {required String userName, required String otp}) async {
    return await HttpService.postRequest(
        endPoint: Strings.sLoginEndPoint,
        data: {'userName': userName, 'otp': otp}).then(
      (value) {
        return value.data;
      },
    );
  }
}
