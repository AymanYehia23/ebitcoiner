import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/strings.dart';

class HttpService {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        queryParameters: {
          'key':
              'c3fe929c35dd0cbcc8f062bb60e9d2ce7d14be21513d07c53e370d81ba9de4a4'
        },
      ),
    );
    initializeInterceptors();
  }

  static Future<Response> getRequest({
    required String endPoint,
  }) async {
    return await dio.get(
      endPoint,
    );
  }

  static Future<Response> postRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      endPoint,
      data: data,
    );
  }

  static initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, errorInterceptorHandler) {
          return errorInterceptorHandler.next(error);
        },
        onRequest: (request, requestInterceptorHandler) {
          //print('${request.baseUrl}${request.path}${request.queryParameters}');
          return requestInterceptorHandler.next(request);
        },
        onResponse: (response, responseInterceptorHandler) {
          return responseInterceptorHandler.next(response);
          //print(response.data);
        },
      ),
    );
  }
}
