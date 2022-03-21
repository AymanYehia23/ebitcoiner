abstract class LogoutRepo{
  Future<String> postLogout({required String? refreshToken});
}