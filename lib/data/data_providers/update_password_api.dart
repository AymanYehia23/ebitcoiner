import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/repositories/update_password_repo.dart';

class UpdatePasswordApi implements UpdatePasswordRepo {
  @override
  Future<String> putUpdatePassword(
      {required String password, required String rePassword}) async {
    return await HttpService.putRequest(
        endPoint: Strings.updatePasswordEndPoint,
        data: {
          'password': password,
          'newPassword': rePassword,
        }).then((value) => value.data);
  }
}
