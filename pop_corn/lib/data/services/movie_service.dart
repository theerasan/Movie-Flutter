import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';

abstract class MovieService {
  void log();
  Future<MovieListDTO> getMovies(int page);
}