import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';

abstract class MovieService {
  Future<MovieListDTO> getMovies(int page);
}