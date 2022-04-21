abstract class LoginRepo {
  Future<dynamic> fPostLogin(
      {required String userName, required String password});

  Future<dynamic> sPostLogin({required String userName, required String otp});
}
