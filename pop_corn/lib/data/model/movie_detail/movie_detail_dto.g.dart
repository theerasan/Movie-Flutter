// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailDTO _$MovieDetailDTOFromJson(Map<String, dynamic> json) =>
    _MovieDetailDTO(
      adult: json['adult'] as bool,
      posterPath: json['poster_path'] as String,
      backdropPath: json['backdrop_path'] as String,
      title: json['title'] as String,
      description: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      credits: CreditsDTO.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailDTOToJson(_MovieDetailDTO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'overview': instance.description,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'genres': instance.genres,
      'credits': instance.credits,
    };
