abstract class LogoutRepo{
  Future<dynamic> postLogout({required String? refreshToken});
}