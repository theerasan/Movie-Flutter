import 'package:pop_corn/data/repository/movie_repository.dart';
import 'package:pop_corn/data/services/movie_service.dart';

class MovieRepositoryImpl implements MovieRepository {

  final MovieService service;

  const MovieRepositoryImpl({required this.service});

  @override
  void log() {
    service.log();
  }
}