import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/data/http/http_service.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/get_user_data_repo.dart';

class UserDataApi implements UserDataRepo {
  @override
  Future<User> getUserData() async {
    return await HttpService.getRequest(endPoint: Strings.getUserDataEndPoint)
        .then((value) => User.fromJson(value.data));
  }
}
