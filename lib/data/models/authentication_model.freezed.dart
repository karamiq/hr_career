// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticationModel {

 int get userID; String get token; String? get accessToken; DateTime get createdAt; DateTime get expiresAt;
/// Create a copy of AuthenticationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationModelCopyWith<AuthenticationModel> get copyWith => _$AuthenticationModelCopyWithImpl<AuthenticationModel>(this as AuthenticationModel, _$identity);

  /// Serializes this AuthenticationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationModel&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.token, token) || other.token == token)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userID,token,accessToken,createdAt,expiresAt);

@override
String toString() {
  return 'AuthenticationModel(userID: $userID, token: $token, accessToken: $accessToken, createdAt: $createdAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $AuthenticationModelCopyWith<$Res>  {
  factory $AuthenticationModelCopyWith(AuthenticationModel value, $Res Function(AuthenticationModel) _then) = _$AuthenticationModelCopyWithImpl;
@useResult
$Res call({
 int userID, String token, String? accessToken, DateTime createdAt, DateTime expiresAt
});




}
/// @nodoc
class _$AuthenticationModelCopyWithImpl<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  _$AuthenticationModelCopyWithImpl(this._self, this._then);

  final AuthenticationModel _self;
  final $Res Function(AuthenticationModel) _then;

/// Create a copy of AuthenticationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userID = null,Object? token = null,Object? accessToken = freezed,Object? createdAt = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
userID: null == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as int,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthenticationModel].
extension AuthenticationModelPatterns on AuthenticationModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthenticationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticationModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthenticationModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthenticationModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthenticationModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthenticationModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userID,  String token,  String? accessToken,  DateTime createdAt,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticationModel() when $default != null:
return $default(_that.userID,_that.token,_that.accessToken,_that.createdAt,_that.expiresAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userID,  String token,  String? accessToken,  DateTime createdAt,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _AuthenticationModel():
return $default(_that.userID,_that.token,_that.accessToken,_that.createdAt,_that.expiresAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userID,  String token,  String? accessToken,  DateTime createdAt,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthenticationModel() when $default != null:
return $default(_that.userID,_that.token,_that.accessToken,_that.createdAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc

@jsonSerializable
class _AuthenticationModel extends AuthenticationModel {
  const _AuthenticationModel({required this.userID, required this.token, this.accessToken = null, required this.createdAt, required this.expiresAt}): super._();
  factory _AuthenticationModel.fromJson(Map<String, dynamic> json) => _$AuthenticationModelFromJson(json);

@override final  int userID;
@override final  String token;
@override@JsonKey() final  String? accessToken;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;

/// Create a copy of AuthenticationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticationModelCopyWith<_AuthenticationModel> get copyWith => __$AuthenticationModelCopyWithImpl<_AuthenticationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthenticationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticationModel&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.token, token) || other.token == token)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userID,token,accessToken,createdAt,expiresAt);

@override
String toString() {
  return 'AuthenticationModel(userID: $userID, token: $token, accessToken: $accessToken, createdAt: $createdAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$AuthenticationModelCopyWith<$Res> implements $AuthenticationModelCopyWith<$Res> {
  factory _$AuthenticationModelCopyWith(_AuthenticationModel value, $Res Function(_AuthenticationModel) _then) = __$AuthenticationModelCopyWithImpl;
@override @useResult
$Res call({
 int userID, String token, String? accessToken, DateTime createdAt, DateTime expiresAt
});




}
/// @nodoc
class __$AuthenticationModelCopyWithImpl<$Res>
    implements _$AuthenticationModelCopyWith<$Res> {
  __$AuthenticationModelCopyWithImpl(this._self, this._then);

  final _AuthenticationModel _self;
  final $Res Function(_AuthenticationModel) _then;

/// Create a copy of AuthenticationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userID = null,Object? token = null,Object? accessToken = freezed,Object? createdAt = null,Object? expiresAt = null,}) {
  return _then(_AuthenticationModel(
userID: null == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as int,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
