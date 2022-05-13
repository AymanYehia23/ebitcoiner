import 'package:hash_store/data/models/sign_up_model.dart';

abstract class SignUpRepo {
  Future<dynamic> postSignUp({required SignUPRequestModel signUPRequestModel});
}
