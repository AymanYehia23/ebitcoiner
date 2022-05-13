import 'package:hash_store/data/models/delete_account_model.dart';
import 'package:hash_store/data/repositories/delete_account_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class DeleteAccountApi implements DeleteAccountRepo {
  @override
  Future<dynamic> requestDeleteAccount(
      {required DeleteAccountModel deleteAccountModel}) async {
    return await HttpService.deleteRequest(
      endPoint: Strings.deleteAccountEndPoint,
      data: deleteAccountModel.toMap(),
    ).then((value) => value.data);
  }
}
