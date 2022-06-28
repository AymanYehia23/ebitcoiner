import 'package:ebitcoiner/core/constants/strings.dart';
import 'package:ebitcoiner/data/http/http_service.dart';
import 'package:ebitcoiner/data/repositories/login_repo.dart';

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
