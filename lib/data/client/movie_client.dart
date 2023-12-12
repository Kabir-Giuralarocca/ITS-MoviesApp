import 'package:dio/dio.dart';
import 'package:movies_app/data/config.dart';
import 'package:movies_app/data/interceptors/error_interceptor.dart';
import 'package:movies_app/data/interceptors/token_interceptor.dart';

class MovieClient {
  static final options = BaseOptions(
    baseUrl: "$baseUrl/api/Movies",
    contentType: "application/json; charset=UTF-8",
  );

  static Dio get dio {
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      TokenInterceptor(),
      ErrorInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
    return dio;
  }
}
