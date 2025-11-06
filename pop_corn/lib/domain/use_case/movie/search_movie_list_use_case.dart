import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/util/result.dart';

abstract class SearchMovieListUseCase {
  Future<Result<MoviePageData>> getMovies(String query);
  Future<Result<MoviePageData>> loadMoreMovies();
}