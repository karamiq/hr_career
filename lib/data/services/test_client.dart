import 'package:app/core/network/callback.dart';
import 'package:app/core/network/dio_models/dio_module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '_clients.dart';
import 'package:app/core/models/default_response.dart';

part "test_client.g.dart";

@riverpod
TestClient testClient(Ref ref) => TestClient(ref.dio);

@RestApi()
abstract class TestClient {
  factory TestClient(Dio dio, {String baseUrl}) = _TestClient;

  @GET('/auth/test')
  FutureDefaultResponse<dynamic> test();
}
