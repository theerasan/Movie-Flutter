import 'package:pop_corn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';

abstract class MovieService {
  Future<MovieListDTO> getMovies(int page);
  Future<MovieListDTO> searchMovies(String query, int page);
  Future<MovieDetailDTO> getMovieDetailById(int id);
}
