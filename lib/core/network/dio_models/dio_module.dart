import 'package:app/core/network/dio_models.dart';
import 'package:app/data/providers/access_token_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_module.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = BaseDioConfig.createBaseDio();
  dio.interceptors.add(AccessTokenInterceptor(ref.read(accessTokenProvider.notifier)));
  dio.interceptors.add(ResponseInterceptor());
  return dio;
}

extension DioRefX on Ref {
  Dio get dio => read(dioProvider);
}
