// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailDTO {

@JsonKey(name: 'adult') bool get adult;@JsonKey(name: 'poster_path') String get posterPath;@JsonKey(name: 'backdrop_path') String get backdropPath;@JsonKey(name: 'title') String get title;@JsonKey(name: 'overview') String get description;@JsonKey(name: 'release_date') String get releaseDate;@JsonKey(name: 'vote_average') double get voteAverage;@JsonKey(name: 'genres') List<GenreDTO> get genres;@JsonKey(name: 'credits') CreditsDTO get credits;
/// Create a copy of MovieDetailDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailDTOCopyWith<MovieDetailDTO> get copyWith => _$MovieDetailDTOCopyWithImpl<MovieDetailDTO>(this as MovieDetailDTO, _$identity);

  /// Serializes this MovieDetailDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailDTO&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.credits, credits) || other.credits == credits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,posterPath,backdropPath,title,description,releaseDate,voteAverage,const DeepCollectionEquality().hash(genres),credits);

@override
String toString() {
  return 'MovieDetailDTO(adult: $adult, posterPath: $posterPath, backdropPath: $backdropPath, title: $title, description: $description, releaseDate: $releaseDate, voteAverage: $voteAverage, genres: $genres, credits: $credits)';
}


}

/// @nodoc
abstract mixin class $MovieDetailDTOCopyWith<$Res>  {
  factory $MovieDetailDTOCopyWith(MovieDetailDTO value, $Res Function(MovieDetailDTO) _then) = _$MovieDetailDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'adult') bool adult,@JsonKey(name: 'poster_path') String posterPath,@JsonKey(name: 'backdrop_path') String backdropPath,@JsonKey(name: 'title') String title,@JsonKey(name: 'overview') String description,@JsonKey(name: 'release_date') String releaseDate,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'genres') List<GenreDTO> genres,@JsonKey(name: 'credits') CreditsDTO credits
});


$CreditsDTOCopyWith<$Res> get credits;

}
/// @nodoc
class _$MovieDetailDTOCopyWithImpl<$Res>
    implements $MovieDetailDTOCopyWith<$Res> {
  _$MovieDetailDTOCopyWithImpl(this._self, this._then);

  final MovieDetailDTO _self;
  final $Res Function(MovieDetailDTO) _then;

/// Create a copy of MovieDetailDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? posterPath = null,Object? backdropPath = null,Object? title = null,Object? description = null,Object? releaseDate = null,Object? voteAverage = null,Object? genres = null,Object? credits = null,}) {
  return _then(_self.copyWith(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreDTO>,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as CreditsDTO,
  ));
}
/// Create a copy of MovieDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreditsDTOCopyWith<$Res> get credits {
  
  return $CreditsDTOCopyWith<$Res>(_self.credits, (value) {
    return _then(_self.copyWith(credits: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieDetailDTO].
extension MovieDetailDTOPatterns on MovieDetailDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailDTO value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'backdrop_path')  String backdropPath, @JsonKey(name: 'title')  String title, @JsonKey(name: 'overview')  String description, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'genres')  List<GenreDTO> genres, @JsonKey(name: 'credits')  CreditsDTO credits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailDTO() when $default != null:
return $default(_that.adult,_that.posterPath,_that.backdropPath,_that.title,_that.description,_that.releaseDate,_that.voteAverage,_that.genres,_that.credits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'backdrop_path')  String backdropPath, @JsonKey(name: 'title')  String title, @JsonKey(name: 'overview')  String description, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'genres')  List<GenreDTO> genres, @JsonKey(name: 'credits')  CreditsDTO credits)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailDTO():
return $default(_that.adult,_that.posterPath,_that.backdropPath,_that.title,_that.description,_that.releaseDate,_that.voteAverage,_that.genres,_that.credits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'poster_path')  String posterPath, @JsonKey(name: 'backdrop_path')  String backdropPath, @JsonKey(name: 'title')  String title, @JsonKey(name: 'overview')  String description, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'genres')  List<GenreDTO> genres, @JsonKey(name: 'credits')  CreditsDTO credits)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailDTO() when $default != null:
return $default(_that.adult,_that.posterPath,_that.backdropPath,_that.title,_that.description,_that.releaseDate,_that.voteAverage,_that.genres,_that.credits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetailDTO implements MovieDetailDTO {
  const _MovieDetailDTO({@JsonKey(name: 'adult') required this.adult, @JsonKey(name: 'poster_path') required this.posterPath, @JsonKey(name: 'backdrop_path') required this.backdropPath, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'overview') required this.description, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'vote_average') required this.voteAverage, @JsonKey(name: 'genres') required final  List<GenreDTO> genres, @JsonKey(name: 'credits') required this.credits}): _genres = genres;
  factory _MovieDetailDTO.fromJson(Map<String, dynamic> json) => _$MovieDetailDTOFromJson(json);

@override@JsonKey(name: 'adult') final  bool adult;
@override@JsonKey(name: 'poster_path') final  String posterPath;
@override@JsonKey(name: 'backdrop_path') final  String backdropPath;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'overview') final  String description;
@override@JsonKey(name: 'release_date') final  String releaseDate;
@override@JsonKey(name: 'vote_average') final  double voteAverage;
 final  List<GenreDTO> _genres;
@override@JsonKey(name: 'genres') List<GenreDTO> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override@JsonKey(name: 'credits') final  CreditsDTO credits;

/// Create a copy of MovieDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailDTOCopyWith<_MovieDetailDTO> get copyWith => __$MovieDetailDTOCopyWithImpl<_MovieDetailDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailDTO&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.credits, credits) || other.credits == credits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adult,posterPath,backdropPath,title,description,releaseDate,voteAverage,const DeepCollectionEquality().hash(_genres),credits);

@override
String toString() {
  return 'MovieDetailDTO(adult: $adult, posterPath: $posterPath, backdropPath: $backdropPath, title: $title, description: $description, releaseDate: $releaseDate, voteAverage: $voteAverage, genres: $genres, credits: $credits)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailDTOCopyWith<$Res> implements $MovieDetailDTOCopyWith<$Res> {
  factory _$MovieDetailDTOCopyWith(_MovieDetailDTO value, $Res Function(_MovieDetailDTO) _then) = __$MovieDetailDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'adult') bool adult,@JsonKey(name: 'poster_path') String posterPath,@JsonKey(name: 'backdrop_path') String backdropPath,@JsonKey(name: 'title') String title,@JsonKey(name: 'overview') String description,@JsonKey(name: 'release_date') String releaseDate,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'genres') List<GenreDTO> genres,@JsonKey(name: 'credits') CreditsDTO credits
});


@override $CreditsDTOCopyWith<$Res> get credits;

}
/// @nodoc
class __$MovieDetailDTOCopyWithImpl<$Res>
    implements _$MovieDetailDTOCopyWith<$Res> {
  __$MovieDetailDTOCopyWithImpl(this._self, this._then);

  final _MovieDetailDTO _self;
  final $Res Function(_MovieDetailDTO) _then;

/// Create a copy of MovieDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? posterPath = null,Object? backdropPath = null,Object? title = null,Object? description = null,Object? releaseDate = null,Object? voteAverage = null,Object? genres = null,Object? credits = null,}) {
  return _then(_MovieDetailDTO(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreDTO>,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as CreditsDTO,
  ));
}

/// Create a copy of MovieDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreditsDTOCopyWith<$Res> get credits {
  
  return $CreditsDTOCopyWith<$Res>(_self.credits, (value) {
    return _then(_self.copyWith(credits: value));
  });
}
}

// dart format on
