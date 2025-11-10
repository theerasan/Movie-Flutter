// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDTO {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'adult') bool get adult;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'release_date') String get releaseDate;@JsonKey(name: 'title') String get title;@JsonKey(name: 'vote_average') double get voteAverage;
/// Create a copy of MovieDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDTOCopyWith<MovieDTO> get copyWith => _$MovieDTOCopyWithImpl<MovieDTO>(this as MovieDTO, _$identity);

  /// Serializes this MovieDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,adult,posterPath,releaseDate,title,voteAverage);

@override
String toString() {
  return 'MovieDTO(id: $id, adult: $adult, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class $MovieDTOCopyWith<$Res>  {
  factory $MovieDTOCopyWith(MovieDTO value, $Res Function(MovieDTO) _then) = _$MovieDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'adult') bool adult,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'release_date') String releaseDate,@JsonKey(name: 'title') String title,@JsonKey(name: 'vote_average') double voteAverage
});




}
/// @nodoc
class _$MovieDTOCopyWithImpl<$Res>
    implements $MovieDTOCopyWith<$Res> {
  _$MovieDTOCopyWithImpl(this._self, this._then);

  final MovieDTO _self;
  final $Res Function(MovieDTO) _then;

/// Create a copy of MovieDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? adult = null,Object? posterPath = freezed,Object? releaseDate = null,Object? title = null,Object? voteAverage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDTO].
extension MovieDTOPatterns on MovieDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDTO value)  $default,){
final _that = this;
switch (_that) {
case _MovieDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'title')  String title, @JsonKey(name: 'vote_average')  double voteAverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDTO() when $default != null:
return $default(_that.id,_that.adult,_that.posterPath,_that.releaseDate,_that.title,_that.voteAverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'title')  String title, @JsonKey(name: 'vote_average')  double voteAverage)  $default,) {final _that = this;
switch (_that) {
case _MovieDTO():
return $default(_that.id,_that.adult,_that.posterPath,_that.releaseDate,_that.title,_that.voteAverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'title')  String title, @JsonKey(name: 'vote_average')  double voteAverage)?  $default,) {final _that = this;
switch (_that) {
case _MovieDTO() when $default != null:
return $default(_that.id,_that.adult,_that.posterPath,_that.releaseDate,_that.title,_that.voteAverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDTO implements MovieDTO {
  const _MovieDTO({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'adult') required this.adult, @JsonKey(name: 'poster_path') required this.posterPath, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'vote_average') required this.voteAverage});
  factory _MovieDTO.fromJson(Map<String, dynamic> json) => _$MovieDTOFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'adult') final  bool adult;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'release_date') final  String releaseDate;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'vote_average') final  double voteAverage;

/// Create a copy of MovieDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDTOCopyWith<_MovieDTO> get copyWith => __$MovieDTOCopyWithImpl<_MovieDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,adult,posterPath,releaseDate,title,voteAverage);

@override
String toString() {
  return 'MovieDTO(id: $id, adult: $adult, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class _$MovieDTOCopyWith<$Res> implements $MovieDTOCopyWith<$Res> {
  factory _$MovieDTOCopyWith(_MovieDTO value, $Res Function(_MovieDTO) _then) = __$MovieDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'adult') bool adult,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'release_date') String releaseDate,@JsonKey(name: 'title') String title,@JsonKey(name: 'vote_average') double voteAverage
});




}
/// @nodoc
class __$MovieDTOCopyWithImpl<$Res>
    implements _$MovieDTOCopyWith<$Res> {
  __$MovieDTOCopyWithImpl(this._self, this._then);

  final _MovieDTO _self;
  final $Res Function(_MovieDTO) _then;

/// Create a copy of MovieDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? adult = null,Object? posterPath = freezed,Object? releaseDate = null,Object? title = null,Object? voteAverage = null,}) {
  return _then(_MovieDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
