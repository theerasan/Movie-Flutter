import 'package:pop_corn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';
import 'package:pop_corn/util/result.dart';

abstract class MovieRepository {
  Future<Result<MovieListDTO>> getMovies(int page);
  Future<Result<MovieListDTO>> searchMovies(String query, int page);
  Future<Result<MovieDetailDTO>> getMovieDetailById(int id);
}
