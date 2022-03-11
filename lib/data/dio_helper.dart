import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://expertminer.herokuapp.com/api/',
      receiveDataWhenStatusError: true,
    ),);
  }

  static Future<Response> getData({
    required String url,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.post(
      url,
      data: data,
    );
  }

}
