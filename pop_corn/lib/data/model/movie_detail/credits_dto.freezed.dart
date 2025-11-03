// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credits_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditsDTO {

@JsonKey(name: 'cast') List<CastDTO> get casts;
/// Create a copy of CreditsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditsDTOCopyWith<CreditsDTO> get copyWith => _$CreditsDTOCopyWithImpl<CreditsDTO>(this as CreditsDTO, _$identity);

  /// Serializes this CreditsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditsDTO&&const DeepCollectionEquality().equals(other.casts, casts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(casts));

@override
String toString() {
  return 'CreditsDTO(casts: $casts)';
}


}

/// @nodoc
abstract mixin class $CreditsDTOCopyWith<$Res>  {
  factory $CreditsDTOCopyWith(CreditsDTO value, $Res Function(CreditsDTO) _then) = _$CreditsDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cast') List<CastDTO> casts
});




}
/// @nodoc
class _$CreditsDTOCopyWithImpl<$Res>
    implements $CreditsDTOCopyWith<$Res> {
  _$CreditsDTOCopyWithImpl(this._self, this._then);

  final CreditsDTO _self;
  final $Res Function(CreditsDTO) _then;

/// Create a copy of CreditsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? casts = null,}) {
  return _then(_self.copyWith(
casts: null == casts ? _self.casts : casts // ignore: cast_nullable_to_non_nullable
as List<CastDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditsDTO].
extension CreditsDTOPatterns on CreditsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditsDTO value)  $default,){
final _that = this;
switch (_that) {
case _CreditsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CreditsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cast')  List<CastDTO> casts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditsDTO() when $default != null:
return $default(_that.casts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cast')  List<CastDTO> casts)  $default,) {final _that = this;
switch (_that) {
case _CreditsDTO():
return $default(_that.casts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cast')  List<CastDTO> casts)?  $default,) {final _that = this;
switch (_that) {
case _CreditsDTO() when $default != null:
return $default(_that.casts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditsDTO implements CreditsDTO {
  const _CreditsDTO({@JsonKey(name: 'cast') required final  List<CastDTO> casts}): _casts = casts;
  factory _CreditsDTO.fromJson(Map<String, dynamic> json) => _$CreditsDTOFromJson(json);

 final  List<CastDTO> _casts;
@override@JsonKey(name: 'cast') List<CastDTO> get casts {
  if (_casts is EqualUnmodifiableListView) return _casts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_casts);
}


/// Create a copy of CreditsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditsDTOCopyWith<_CreditsDTO> get copyWith => __$CreditsDTOCopyWithImpl<_CreditsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditsDTO&&const DeepCollectionEquality().equals(other._casts, _casts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_casts));

@override
String toString() {
  return 'CreditsDTO(casts: $casts)';
}


}

/// @nodoc
abstract mixin class _$CreditsDTOCopyWith<$Res> implements $CreditsDTOCopyWith<$Res> {
  factory _$CreditsDTOCopyWith(_CreditsDTO value, $Res Function(_CreditsDTO) _then) = __$CreditsDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cast') List<CastDTO> casts
});




}
/// @nodoc
class __$CreditsDTOCopyWithImpl<$Res>
    implements _$CreditsDTOCopyWith<$Res> {
  __$CreditsDTOCopyWithImpl(this._self, this._then);

  final _CreditsDTO _self;
  final $Res Function(_CreditsDTO) _then;

/// Create a copy of CreditsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? casts = null,}) {
  return _then(_CreditsDTO(
casts: null == casts ? _self._casts : casts // ignore: cast_nullable_to_non_nullable
as List<CastDTO>,
  ));
}


}

// dart format on
