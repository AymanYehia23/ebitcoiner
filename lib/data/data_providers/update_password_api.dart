import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/update_password_model.dart';
import 'package:hash_store/data/repositories/update_password_repo.dart';

class UpdatePasswordApi implements UpdatePasswordRepo {
  @override
  Future<dynamic> putUpdatePassword(
      {required UpdatePasswordModel updatePasswordModel}) async {
    return await HttpService.putRequest(
      endPoint: Strings.updatePasswordEndPoint,
      data: updatePasswordModel.toMap(),
    ).then((value) => value.data);
  }
}
