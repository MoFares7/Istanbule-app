import 'package:dio/dio.dart';

class DioInstance {
  Dio? _dio;

  Dio get dio => _dio ?? _instantiate();

  Dio _instantiate() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://rest.istanbulru.com/api',
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        responseHeader: false,
        requestHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}
