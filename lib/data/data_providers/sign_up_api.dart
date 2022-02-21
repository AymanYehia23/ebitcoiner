import 'package:hash_store/data/dio/dio_helper.dart';

import '../../core/constants/strings.dart';

class SignUpAPI {
  Future<dynamic> signUpAPI({required Map<String, dynamic> data}) async {
    return DioHelper.postData(url: Strings.signUp, data: data);
  }
}
