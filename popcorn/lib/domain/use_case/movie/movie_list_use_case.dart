import 'package:popcorn/domain/model/movie_page_data.dart';
import 'package:popcorn/util/result.dart';

abstract class MovieListUseCase {
  Future<Result<MoviePageData>> getMovies();
  Future<Result<MoviePageData>> loadMoreMovies();
}
