import 'package:app/core/network/callback.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: true, genericArgumentFactories: true)
class DefaultResponse<T> {
  // "message": "تم بنجاح",
  final String errorMessage;
  // "data": {},
  final T data;
  // "statusCode": 200
  final double statusCode;

  const DefaultResponse({required this.errorMessage, required this.data, required this.statusCode});

  factory DefaultResponse.fromJson(Map<String, dynamic> json, FromJsonT<T> fromJsonT) =>
      _$DefaultResponseFromJson<T>(json, fromJsonT);

  DefaultResponse<T> copyWith({
    final String? errorMessage,
    // "data": {},
    final T? result,
    // "error": true
    final double? statusCode,
  }) {
    return DefaultResponse<T>(
      errorMessage: errorMessage ?? this.errorMessage,
      data: result ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

@JsonEnum(alwaysCreate: true)
enum Role {
  @JsonValue("Supervisor")
  supervisor,
  unknown;

  String toJson() => _$RoleEnumMap[this]!;
}
