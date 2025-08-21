import 'package:app/core/models/default_response.dart';
import 'package:app/core/network/callback.dart';
import 'package:app/core/network/dio_models/auth_dio_module.dart';
import 'package:app/data/models/authentication_model.dart';
import 'package:app/data/models/requests_models/login_request_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '_clients.dart';

part "auth_client.g.dart";

@riverpod
AuthClient authClient(Ref ref) => AuthClient(ref.authDio);

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/auth')
  FutureDefaultResponse<AuthenticationModel> login(@Body() LoginRequestModel data);

  @GET('/auth')
  FutureDefaultResponse<String> accessToken();
}
