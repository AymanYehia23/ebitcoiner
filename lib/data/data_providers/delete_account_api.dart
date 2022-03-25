import 'package:hash_store/data/repositories/delete_account_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class DeleteAccountApi implements DeleteAccountRepo {
  @override
  Future<String> requestDeleteAccount(
      {required String password, required String? refreshToken}) async {
    return await HttpService.deleteRequest(
        endPoint: Strings.deleteAccountEndPoint,
        data: {
          'password': password,
          'token': refreshToken,
        }).then((value) => value.data);
  }
}
