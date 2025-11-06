import 'package:pop_corn/data/model/movie_detail/movie_detail_dto.dart';
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
      return Result.error(error);
    }
  }

  @override
  Future<Result<MovieListDTO>> searchMovies(String query, int page) async {
    try {
      final result = await service.searchMovies(query, page);
      return Result.success(result);
    } on Exception catch (error) {
      print("error in repo ${error.toString()}");
      return Result.error(error);
    }
  }

  @override
  Future<Result<MovieDetailDTO>> getMovieDetailById(int id) async {
    try {
      final result = await service.getMovieDetailById(id);
      return Result.success(result);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}