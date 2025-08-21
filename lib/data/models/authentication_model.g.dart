// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    _AuthenticationModel(
      userID: (json['userID'] as num).toInt(),
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
  _AuthenticationModel instance,
) => <String, dynamic>{
  'userID': instance.userID,
  'refreshToken': instance.refreshToken,
};
