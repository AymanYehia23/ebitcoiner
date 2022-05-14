import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';

class HttpService {
  static late Dio _dio;
  static final SecureStorage _secureStorage = SecureStorage();

  static init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        queryParameters: {'key': Strings.apiKey},
        connectTimeout: 15000,
        receiveTimeout: 15000,
      ),
    );
    _initializeInterceptors();
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

  static _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, errorInterceptorHandler) async {
          if ((error.response?.statusCode == 401 &&
              error.response?.data == 'Unauthorized')) {
            if (kDebugMode) {
              print('in if: ${error.response?.data}');
            }
            if (await _secureStorage.containsKey(key: 'refreshToken')) {
              if (kDebugMode) {
                print('find refreshToken');
              }
              await _refreshToken();
              if (await _secureStorage.containsKey(key: 'refreshToken')) {
                return errorInterceptorHandler.resolve(
                  await _retry(error.requestOptions),
                );
              } else {
                return errorInterceptorHandler.next(error);
              }
            }
          }
          return errorInterceptorHandler.next(error);
        },
        onRequest: (request, requestInterceptorHandler) async {
          if (request.path != Strings.sLoginEndPoint ||
              request.path != Strings.getNewAccessTokenEndPoint ||
              request.path != Strings.forgetPasswordEndPoint ||
              request.path != Strings.verifyCodeEndPoint) {
            request.headers = {
              'Authorization':
                  'Bearer ${await _secureStorage.getValue(key: 'accessToken')}'
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

  static Future<void> _refreshToken() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        queryParameters: {'key': Strings.apiKey},
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    );
    final refreshToken = await _secureStorage.getValue(key: 'refreshToken');
    try {
      final response = await dio.post(Strings.getNewAccessTokenEndPoint,
          data: {'token': refreshToken});
      if (kDebugMode) {
        print('successfully got the new access token');
      }
      if (kDebugMode) {
        print(response.data);
      }
      await _secureStorage.addValue(key: 'accessToken', value: response.data);
    } on DioError catch (_) {
      if (kDebugMode) {
        print('refresh token is wrong so log out user');
      }
      await _secureStorage.deleteAll();
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
