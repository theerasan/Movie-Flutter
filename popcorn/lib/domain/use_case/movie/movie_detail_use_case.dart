import 'package:popcorn/domain/model/movie_detail.dart';
import 'package:popcorn/util/result.dart';

abstract class MovieDetailUseCase {
  Future<Result<MovieDetail>> getMovieDetailById(int id);
}
