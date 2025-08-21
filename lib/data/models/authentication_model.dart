import '../../core/models/_models.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
abstract class AuthenticationModel with _$AuthenticationModel {
  const AuthenticationModel._();

  @jsonSerializable
  const factory AuthenticationModel({required int userID, required String refreshToken}) =
      _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => _$AuthenticationModelFromJson(json);
}
