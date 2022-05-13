import '../models/login_model.dart';

abstract class LoginRepo {
  Future<dynamic> fPostLogin(
      {required FirstLoginRequestModel firstLoginRequestModel});

  Future<LoginResponseModel> sPostLogin({required SecondLoginRequestModel secondLoginRequestModel});
}
