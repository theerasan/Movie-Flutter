import 'package:pop_corn/data/model/movie_list/movie_list_dto.dart';
import 'package:pop_corn/data/repository/movie_repository.dart';
import 'package:pop_corn/data/services/movie_service.dart';
import 'package:pop_corn/util/result.dart';

class MovieRepositoryImpl implements MovieRepository {

  final MovieService service;
  const MovieRepositoryImpl({required this.service});

  @override
  Future<Result<MovieListDTO>> getMovies(int page) async {
    try {
      final result = await service.getMovies(page);
      return Result.success(result);
    } on Exception catch (error) {
      print('error in repo');
      return Result.error(error);
    }
  }
}