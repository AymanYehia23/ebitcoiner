import 'package:ebitcoiner/data/models/sign_up_model.dart';
import 'package:ebitcoiner/data/repositories/sign_up_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class SignUpAPI implements SignUpRepo {
  @override
  Future<dynamic> postSignUp({required SignUPRequestModel signUPRequestModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.signUpEndPoint,
      data: signUPRequestModel.toMap(),
    ).then((value) => value.data);
  }
}
