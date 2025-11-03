
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
abstract class MovieDTO with _$MovieDTO {
  const factory MovieDTO({
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _MovieDTO;

  factory MovieDTO.fromJson(Map<String, dynamic> json) => _$MovieDTOFromJson(json);
}