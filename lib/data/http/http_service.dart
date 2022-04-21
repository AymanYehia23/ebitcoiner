import 'package:dio/dio.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';

class HttpService {
  static late Dio _dio;
  static SecureStorage secureStorage = SecureStorage();

  static init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        queryParameters: {'key': Strings.apiKey},
      ),
    );
    initializeInterceptors();
  }

  static Future<Response> getRequest({
    required String endPoint,
  }) async {
    return await _dio.get(
      endPoint,
    );
  }

  static Future<Response> postRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    return await _dio.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response> putRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    return await _dio.put(
      endPoint,
      data: data,
    );
  }

  static Future<Response> deleteRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    return await _dio.delete(
      endPoint,
      data: data,
    );
  }

  static initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, errorInterceptorHandler) async {
          if ((error.response?.statusCode == 401 &&
              error.response?.data == 'Unauthorized')) {
            print('in if: ${error.response?.data}');
            if (await secureStorage.containsKey(key: 'refreshToken')) {
              print('find refreshToken');
              await refreshToken();
              return errorInterceptorHandler.resolve(
                await _retry(error.requestOptions),
              );
            }
          }
          print('out of if: ${error.response!.data}');
          return errorInterceptorHandler.next(error);
        },
        onRequest: (request, requestInterceptorHandler) async {
          if (request.path != Strings.sLoginEndPoint ||
              request.path != Strings.getNewAccessTokenEndPoint) {
            request.headers = {
              'Authorization':
                  'Bearer ${await secureStorage.getValue(key: 'accessToken')}'
            };
          }
          return requestInterceptorHandler.next(request);
        },
        onResponse: (response, responseInterceptorHandler) {
          return responseInterceptorHandler.next(response);
          //print(response.data);
        },
      ),
    );
  }

  static Future<void> refreshToken() async {
    final refreshToken = await secureStorage.getValue(key: 'refreshToken');
    print(refreshToken);
    final response = await _dio
        .post(Strings.getNewAccessTokenEndPoint, data: {'token': refreshToken});
    if (response.statusCode == 202) {
      // successfully got the new access token
      print('successfully got the new access token');
      print(response.data);
      await secureStorage.deleteValue(key: 'accessToken');
      await secureStorage.addValue(key: 'accessToken', value: response.data);
    } else {
      print('refresh token is wrong so log out user');
      // refresh token is wrong so log out user.
      await secureStorage.deleteValue(key: 'accessToken');
      await secureStorage.deleteValue(key: 'refreshToken');
    }
  }

  static Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
