import 'package:hash_store/data/models/sign_up_model.dart';

abstract class SignUpRepo {
  Future<String> postSignUp({required SignUPRequestModel signUPRequestModel});
}
