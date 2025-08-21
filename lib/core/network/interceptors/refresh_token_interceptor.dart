import 'package:app/data/providers/authentication_provider.dart';
import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Authentication authentication;
  RefreshTokenInterceptor(this.authentication);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final isSignedIn = authentication.isSignedIn();
    final refreshtoken = authentication.build();
    if (isSignedIn) {
      options.headers["X-Refresh-Token"] = refreshtoken?.refreshToken;
      options.headers["X-User-ID"] = refreshtoken?.userID.toString();
    }
    super.onRequest(options, handler);
  }
}
