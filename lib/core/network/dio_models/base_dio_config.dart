import 'package:app/core/network/interceptors/error_interceptor.dart';
import 'package:app/core/network/interceptors/response_interceptor.dart';
import 'package:app/core/utils/constants/api_document.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

/// Base configuration for Dio instances
/// Contains common setup logic to eliminate duplication
class BaseDioConfig {
  /// Creates a base Dio instance with common configuration
  static Dio createBaseDio() {
    final dio = Dio();
    dio
      ..options.baseUrl = ApiDocument.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.sendTimeout = const Duration(seconds: 60)
      ..options.contentType = 'application/json; charset=utf-8'
      ..options.headers = {"accept": "text/plain", "Content-Type": "application/json"}
      ..interceptors.add(createResponseInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(AwesomeDioInterceptor());
    }

    return dio;
  }

  /// Creates a standard error interceptor
  static Interceptor createErrorInterceptor({void Function()? on401Error}) {
    return ErrorInterceptor(on401Error: on401Error);
  }

  /// Creates a response interceptor
  static Interceptor createResponseInterceptor() {
    return ResponseInterceptor();
  }
}
