abstract class LogoutRepo{
  Future<void> postLogout({required String? refreshToken});
}