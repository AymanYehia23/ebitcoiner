import '../models/logout_model.dart';

abstract class LogoutRepo{
  Future<dynamic> postLogout({required LogoutModel logoutModel});
}