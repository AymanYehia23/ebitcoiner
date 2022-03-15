import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class SignUpAPI implements SignUpRepo {
  @override
  Future<String> postSignUp({required SignUPModel signUPModel}) async {
    final response = await HttpService.postRequest(
      endPoint: Strings.signUpEndPoint,
      data: signUPModel.toMap(),
    );
    return response.data;
  }
}
