import 'package:app/data/providers/authentication_provider.dart';
import 'package:app/core/network/interceptors/refresh_token_interceptor.dart';
import 'package:app/core/network/dio_models/base_dio_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_dio_module.g.dart';

@riverpod
Dio authDio(Ref ref) {
  final dio = BaseDioConfig.createBaseDio();

  // Add refresh token interceptor
  dio.interceptors.add(RefreshTokenInterceptor(ref.read(authenticationProvider.notifier)));

  // Add error interceptor with logout on 401
  dio.interceptors.add(
    BaseDioConfig.createErrorInterceptor(
      on401Error: () => ref.read(authenticationProvider.notifier).logout(),
    ),
  );

  return dio;
}

extension DefaultDioRefX on Ref {
  Dio get authDio => read(authDioProvider);
}
