import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/repositories/login_repo.dart';

import '../models/login_model.dart';

class LoginApi implements LoginRepo {
  @override
  Future<dynamic> fPostLogin(
      {required FirstLoginRequestModel firstLoginRequestModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.fLoginEndPoint,
      data: firstLoginRequestModel.toMap(),
    ).then(
      (value) {
        return value.data;
      },
    );
  }

  @override
  Future<LoginResponseModel> sPostLogin(
      {required SecondLoginRequestModel secondLoginRequestModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.sLoginEndPoint,
      data: secondLoginRequestModel.toMap(),
    ).then(
      (value) {
        return LoginResponseModel.fromJson(value.data);
      },
    );
  }
}
