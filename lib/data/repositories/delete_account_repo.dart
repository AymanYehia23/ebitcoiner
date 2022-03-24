abstract class DeleteAccountRepo {
  Future<void> requestDeleteAccount(
      {required String password, required String? refreshToken});
}
