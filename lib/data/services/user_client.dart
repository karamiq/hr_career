import 'package:app/core/network/callback.dart';
import 'package:app/core/network/dio_models/dio_module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '_clients.dart';
import 'package:app/core/models/default_response.dart';

part "user_client.g.dart";

@riverpod
UserClient userClient(Ref ref) => UserClient(ref.dio);

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET('/user')
  FutureDefaultResponse<dynamic> getUser({
    @Query('UserID') int? userId,
    @Query('Email') String? email,
    @Query('PageSize') int? pageSize,
    @Query('Page') int? page,
  });

  @POST('/user')
  FutureDefaultResponse<dynamic> createUser(@Body() Map<String, dynamic> user);
}
