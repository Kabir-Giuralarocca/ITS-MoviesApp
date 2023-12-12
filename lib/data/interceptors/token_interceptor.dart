import 'package:dio/dio.dart';
import 'package:movies_app/domain/token.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Token.getToken().then((value) {
      options.headers["Authorization"] = "Bearer $value";
    });
    super.onRequest(options, handler);
  }
}
