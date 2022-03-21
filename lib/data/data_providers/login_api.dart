import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/repositories/login_repo.dart';

import '../models/login_model.dart';

class LoginApi implements LoginRepo {
  @override
  Future<LoginResponseModel> postLogin(
      {required String email, required String password}) async {
    return await HttpService.postRequest(
        endPoint: Strings.loginEndPoint,
        data: {'email': email, 'password': password}).then(
      (value) {
        return LoginResponseModel.fromJson(value.data);
      },
    );
  }

}
