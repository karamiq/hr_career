// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    _AuthenticationModel(
      userID: (json['userID'] as num).toInt(),
      token: json['token'] as String,
      accessToken: json['accessToken'] as String? ?? null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$AuthenticationModelToJson(
  _AuthenticationModel instance,
) => <String, dynamic>{
  'userID': instance.userID,
  'token': instance.token,
  'accessToken': instance.accessToken,
  'createdAt': instance.createdAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
};
