import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/util/result.dart';

abstract class MovieDetailUseCase {

  Future<Result<MovieDetail>> getMovieDetailById(int id);
}