import 'package:pop_corn/config/assets_url_config.dart';
import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';

class MovieDTOToMoviePageDataMapper {
 final AssetsUrlConfig config;

  MovieDTOToMoviePageDataMapper({required this.config});

  MoviePageData map(MovieListDTO dto, List<String> favoriteList) {
    return MoviePageData(
      page: dto.page,
      maxPage: dto.lastPage,
      movies: dto.movies.map((m) => Movie(
        id: m.id,
        title: m.title,
        posterUrl: config.posterBaseUrl + m.posterPath,
        isFavorite: favoriteList.contains(m.id.toString()),
        rating: m.voteAverage,
        releaseDate: m.releaseDate,
        isAdult: m.adult,
      )).toList()
    );
  }
}