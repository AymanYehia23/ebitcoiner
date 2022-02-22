import 'package:hash_store/data/dio_helper.dart';
import 'package:hash_store/data/models/sign_up_model.dart';
import 'package:hash_store/data/repositories/sign_up_repo.dart';

import '../../core/constants/strings.dart';

class SignUpAPI extends SignUpRepo {
  @override
   Future<String> postSignUp({required SignUPModel signUPModel}) async {
    return await DioHelper.postData(
            url: Strings.signUpApIEndPoint, data: signUPModel.toMap())
        .then((value) {
      return value.data.toString();
    });
  }
}
