import 'package:app/data/providers/access_token_provider.dart';
import 'package:dio/dio.dart';

class AccessTokenInterceptor extends Interceptor {
  final AccessToken accessToken;
  AccessTokenInterceptor(this.accessToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final tokenExist = accessToken.exists;
    final token = accessToken.get();
    if (tokenExist) options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler);
  }
}
