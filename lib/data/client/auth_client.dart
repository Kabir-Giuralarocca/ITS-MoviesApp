import 'package:dio/dio.dart';
import 'package:movies_app/data/config.dart';
import 'package:movies_app/data/interceptors/error_interceptor.dart';

class AuthClient {
  static final options = BaseOptions(
    baseUrl: baseUrl,
    contentType: "application/json; charset=UTF-8",
  );

  static Dio get dio {
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      ErrorInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
    return dio;
  }
}
