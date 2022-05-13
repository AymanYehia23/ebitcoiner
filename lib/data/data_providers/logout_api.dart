import 'package:hash_store/data/repositories/logout_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';
import '../models/logout_model.dart';

class LogoutApi implements LogoutRepo {
  @override
  Future<dynamic> postLogout({required LogoutModel logoutModel}) async {
    return await HttpService.postRequest(
      endPoint: Strings.logoutEndPoint,
      data: logoutModel.toMap(),
    ).then(
      (value) => value.data,
    );
  }
}
