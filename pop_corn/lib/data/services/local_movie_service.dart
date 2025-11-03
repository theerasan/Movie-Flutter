import 'package:pop_corn/data/services/movie_service.dart';

class LocalMovieService implements MovieService {
  @override
  void log() {
    print('This is local service');
  }
}