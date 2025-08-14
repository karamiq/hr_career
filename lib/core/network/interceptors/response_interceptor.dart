import 'package:dio/dio.dart';

/// Response interceptor component
/// Handles response processing and data transformation
class ResponseInterceptor extends Interceptor {
  /// Creates a response interceptor
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dynamic data = response.data;
    if (response.data is List<dynamic>) {
      data = {
        "data": response.data,
        "errorMessage": response.statusMessage,
        "statusCode": response.statusCode,
      };
    } else if (response.data is String) {
      data = {"data": {}, "errorMessage": response.data, "statusCode": response.statusCode};
    }

    final modifiedResponse = Response(
      requestOptions: response.requestOptions,
      data: data,
      headers: response.headers,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      extra: response.extra,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
    return handler.next(modifiedResponse);
  }
}
