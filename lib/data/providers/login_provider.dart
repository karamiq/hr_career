import 'package:app/common_lib.dart';
import 'package:app/data/models/authentication_model.dart';
import 'package:app/data/models/requests_models/login_request_model.dart';
import 'package:app/data/providers/authentication_provider.dart';
import 'package:app/data/services/auth_client.dart';
import '../services/_clients.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login with AsyncXNotifierMixin<AuthenticationModel> {
  @override
  Future<AsyncX<AuthenticationModel>> build() => idle();

  @useResult
  RunXCallback<AuthenticationModel> run(LoginRequestModel body) => handle(() async {
    print(body.toJson());
    final result = await ref.read(authClientProvider).login(body).data;
    await ref.read(authenticationProvider.notifier).update((state) => result.data);
    return result.data;
  });
}
