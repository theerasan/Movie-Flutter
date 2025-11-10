import 'package:popcorn/domain/model/movie_page_data.dart';
import 'package:popcorn/util/result.dart';

abstract class SearchMovieListUseCase {
  Future<Result<MoviePageData>> getMovies(String query);
  Future<Result<MoviePageData>> loadMoreMovies();
}
