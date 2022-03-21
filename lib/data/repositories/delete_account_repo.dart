abstract class DeleteAccountRepo {
  Future<String> deleteAccount(
      {required String password, required String? refreshToken});
}
