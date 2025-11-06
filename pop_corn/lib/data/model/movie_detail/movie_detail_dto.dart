import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pop_corn/data/model/movie_detail/credits_dto.dart';
import 'package:pop_corn/data/model/movie_detail/genre_dto.dart';

part 'movie_detail_dto.freezed.dart';
part 'movie_detail_dto.g.dart';

@freezed
abstract class MovieDetailDTO with _$MovieDetailDTO {
  const factory MovieDetailDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'overview') required String description,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'genres') required List<GenreDTO> genres,
    @JsonKey(name: 'credits') required CreditsDTO credits,
  }) = _MovieDetailDTO;

  factory MovieDetailDTO.fromJson(Map<String, dynamic> json) => _$MovieDetailDTOFromJson(json);
}