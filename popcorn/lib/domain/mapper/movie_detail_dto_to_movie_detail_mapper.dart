import 'package:popcorn/config/assets_url_config.dart';
import 'package:popcorn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:popcorn/domain/model/cast.dart';
import 'package:popcorn/domain/model/movie_detail.dart';

class MovieDetailDTOToMovieDetailMapper {
  final AssetsUrlConfig config;

  MovieDetailDTOToMovieDetailMapper({required this.config});

  MovieDetail map(MovieDetailDTO dto, bool isFavorite) {
    return MovieDetail(
      id: dto.id,
      title: dto.title,
      overview: dto.description,
      posterUrl: '${config.posterBaseUrl}${dto.posterPath}',
      backdropUrl: '${config.backdropBaseUrl}${dto.backdropPath}',
      releaseDate: dto.releaseDate,
      isAdult: dto.adult,
      casts: dto.credits.casts
          .map(
            (c) => Cast(
              fullName: c.name,
              character: c.character,
              avatarUrl: (c.profilePath != null)
                  ? '${config.avatarBaseUrl}${c.profilePath}'
                  : null,
            ),
          )
          .toList(),
      voteRating: dto.voteAverage,
      mainGenre: dto.genres.first.name,
      isFavorite: isFavorite,
    );
  }
}
