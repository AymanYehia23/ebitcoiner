import 'package:hash_store/data/models/login_model.dart';

abstract class LoginRepo {
  Future<LoginResponseModel> postLogin(
      {required String email, required String password});
      
}
