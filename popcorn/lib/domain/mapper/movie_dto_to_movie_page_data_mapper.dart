import 'package:popcorn/config/assets_url_config.dart';
import 'package:popcorn/data/model/movie_list/movie_list_dto.dart';
import 'package:popcorn/domain/model/movie.dart';
import 'package:popcorn/domain/model/movie_page_data.dart';

class MovieDTOToMoviePageDataMapper {
  final AssetsUrlConfig config;

  MovieDTOToMoviePageDataMapper({required this.config});

  MoviePageData map(MovieListDTO dto, List<String> favoriteList) {
    return MoviePageData(
      page: dto.page,
      maxPage: dto.lastPage,
      movies: dto.movies
          .map(
            (m) => Movie(
              id: m.id,
              title: m.title,
              posterUrl: (m.posterPath != null)
                  ? '${config.posterBaseUrl}${m.posterPath}'
                  : null,
              isFavorite: favoriteList.contains(m.id.toString()),
              rating: m.voteAverage,
              releaseDate: m.releaseDate,
              isAdult: m.adult,
            ),
          )
          .toList(),
    );
  }
}
