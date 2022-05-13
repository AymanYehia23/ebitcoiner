import '../models/delete_account_model.dart';

abstract class DeleteAccountRepo {
  Future<dynamic> requestDeleteAccount({
    required DeleteAccountModel deleteAccountModel,
  });
}
