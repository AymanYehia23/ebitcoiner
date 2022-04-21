import '../models/login_model.dart';

abstract class UserDataRepo {
  Future<User> getUserData();
}
