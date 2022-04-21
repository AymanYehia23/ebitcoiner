import 'package:hash_store/data/repositories/logout_repo.dart';

import '../../core/constants/strings.dart';
import '../http/http_service.dart';

class LogoutApi implements LogoutRepo{
  @override
  Future<dynamic> postLogout({required String? refreshToken}) async{
    return await HttpService.postRequest(
        endPoint: Strings.logoutEndPoint, data: {'token': refreshToken}).then(
      (value) => value.data,
    );
  }
}