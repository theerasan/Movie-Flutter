import 'package:pop_corn/data/services/movie_service.dart';

class RemoteMovieService implements MovieService {
  @override
  void log() {
    print('This is remote service');
  }
}