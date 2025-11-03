
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pop_corn/data/model/movie_list/movie_dto.dart';

part 'movie_list_dto.freezed.dart';
part 'movie_list_dto.g.dart';

@freezed
abstract class MovieListDTO with _$MovieListDTO {
  const factory MovieListDTO({
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'total_pages') required int lastPage,
    @JsonKey(name: 'results') required List<MovieDTO> movies,
  }) = _MovieListDTO;

  factory MovieListDTO.fromJson(Map<String, dynamic> json) => _$MovieListDTOFromJson(json);
}