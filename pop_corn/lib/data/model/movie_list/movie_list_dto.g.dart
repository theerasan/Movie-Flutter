// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieListDTO _$MovieListDTOFromJson(Map<String, dynamic> json) =>
    _MovieListDTO(
      page: (json['page'] as num).toInt(),
      lastPage: (json['total_pages'] as num).toInt(),
      movies: (json['results'] as List<dynamic>)
          .map((e) => MovieDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListDTOToJson(_MovieListDTO instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.lastPage,
      'results': instance.movies,
    };
