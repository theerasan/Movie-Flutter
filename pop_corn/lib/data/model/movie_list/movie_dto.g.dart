// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDTO _$MovieDTOFromJson(Map<String, dynamic> json) => _MovieDTO(
  id: (json['id'] as num).toInt(),
  adult: json['adult'] as bool,
  posterPath: json['poster_path'] as String,
  releaseDate: json['release_date'] as String,
  title: json['title'] as String,
  voteAverage: (json['vote_average'] as num).toDouble(),
);

Map<String, dynamic> _$MovieDTOToJson(_MovieDTO instance) => <String, dynamic>{
  'id': instance.id,
  'adult': instance.adult,
  'poster_path': instance.posterPath,
  'release_date': instance.releaseDate,
  'title': instance.title,
  'vote_average': instance.voteAverage,
};
