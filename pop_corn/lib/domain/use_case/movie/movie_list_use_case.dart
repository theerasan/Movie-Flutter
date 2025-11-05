import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/util/result.dart';

abstract class MovieListUseCase {
  Future<Result<MoviePageData>> getMovies();
  Future<Result<MoviePageData>> loadMoreMovies();
}