import 'package:hash_store/data/data_providers/sign_up_api.dart';
import 'package:hash_store/data/models/sign_up_model.dart';

class SignUpRepo {
  late SignUpAPI _signUpAPI;

  Future<String> signUpRepo({required SignUPModel signUPModel}) async {
    _signUpAPI = SignUpAPI();
    return await _signUpAPI.signUpAPI(data: signUPModel.toMap()).then((value) {
      return value.data.toString();
    });
  }
}
