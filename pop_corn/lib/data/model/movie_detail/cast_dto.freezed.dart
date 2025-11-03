// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CastDTO {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'profile_path') String get profilePath;@JsonKey(name: 'character') String get character;
/// Create a copy of CastDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CastDTOCopyWith<CastDTO> get copyWith => _$CastDTOCopyWithImpl<CastDTO>(this as CastDTO, _$identity);

  /// Serializes this CastDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CastDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.character, character) || other.character == character));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,profilePath,character);

@override
String toString() {
  return 'CastDTO(id: $id, name: $name, profilePath: $profilePath, character: $character)';
}


}

/// @nodoc
abstract mixin class $CastDTOCopyWith<$Res>  {
  factory $CastDTOCopyWith(CastDTO value, $Res Function(CastDTO) _then) = _$CastDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'profile_path') String profilePath,@JsonKey(name: 'character') String character
});




}
/// @nodoc
class _$CastDTOCopyWithImpl<$Res>
    implements $CastDTOCopyWith<$Res> {
  _$CastDTOCopyWithImpl(this._self, this._then);

  final CastDTO _self;
  final $Res Function(CastDTO) _then;

/// Create a copy of CastDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? profilePath = null,Object? character = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePath: null == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CastDTO].
extension CastDTOPatterns on CastDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CastDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CastDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CastDTO value)  $default,){
final _that = this;
switch (_that) {
case _CastDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CastDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CastDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'profile_path')  String profilePath, @JsonKey(name: 'character')  String character)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CastDTO() when $default != null:
return $default(_that.id,_that.name,_that.profilePath,_that.character);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'profile_path')  String profilePath, @JsonKey(name: 'character')  String character)  $default,) {final _that = this;
switch (_that) {
case _CastDTO():
return $default(_that.id,_that.name,_that.profilePath,_that.character);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'profile_path')  String profilePath, @JsonKey(name: 'character')  String character)?  $default,) {final _that = this;
switch (_that) {
case _CastDTO() when $default != null:
return $default(_that.id,_that.name,_that.profilePath,_that.character);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CastDTO implements CastDTO {
  const _CastDTO({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'profile_path') required this.profilePath, @JsonKey(name: 'character') required this.character});
  factory _CastDTO.fromJson(Map<String, dynamic> json) => _$CastDTOFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'profile_path') final  String profilePath;
@override@JsonKey(name: 'character') final  String character;

/// Create a copy of CastDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CastDTOCopyWith<_CastDTO> get copyWith => __$CastDTOCopyWithImpl<_CastDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CastDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CastDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.character, character) || other.character == character));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,profilePath,character);

@override
String toString() {
  return 'CastDTO(id: $id, name: $name, profilePath: $profilePath, character: $character)';
}


}

/// @nodoc
abstract mixin class _$CastDTOCopyWith<$Res> implements $CastDTOCopyWith<$Res> {
  factory _$CastDTOCopyWith(_CastDTO value, $Res Function(_CastDTO) _then) = __$CastDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'profile_path') String profilePath,@JsonKey(name: 'character') String character
});




}
/// @nodoc
class __$CastDTOCopyWithImpl<$Res>
    implements _$CastDTOCopyWith<$Res> {
  __$CastDTOCopyWithImpl(this._self, this._then);

  final _CastDTO _self;
  final $Res Function(_CastDTO) _then;

/// Create a copy of CastDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? profilePath = null,Object? character = null,}) {
  return _then(_CastDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePath: null == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String,character: null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
