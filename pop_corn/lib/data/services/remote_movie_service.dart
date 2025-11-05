import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';
import 'package:pop_corn/data/services/movie_service.dart';

class RemoteMovieService implements MovieService {
  @override
  void log() {
    print('This is remote service');
  }

  @override
  Future<MovieListDTO> getMovies(int page) {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
}