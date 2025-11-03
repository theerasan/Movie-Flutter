import 'package:pop_corn/data/repository/movie_repository.dart';
import 'package:pop_corn/domain/use_case/movie/movie_use_case.dart';

class MovieUseCaseImpl implements MovieUseCase {
  final MovieRepository repo;
  MovieUseCaseImpl({required this.repo});

  @override
  void log() {
    repo.log();
  }
}