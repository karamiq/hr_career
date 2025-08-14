import 'package:app/core/utils/annotations/annotations_lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezedRequest
abstract class LoginRequestModel with _$LoginRequestModel {
  const LoginRequestModel._();

  @jsonSerializableRequest
  const factory LoginRequestModel({
    required String email,
    required String password,
    required String deviceId,
  }) = _LoginRequestModel;

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this as _LoginRequestModel);
}
