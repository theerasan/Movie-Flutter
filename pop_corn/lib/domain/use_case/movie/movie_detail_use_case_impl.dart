import 'package:pop_corn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:pop_corn/domain/mapper/movie_detail_dto_to_movie_detail_mapper.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:pop_corn/util/result.dart';

import '../../../data/repository/movie_repository.dart';
import '../../../data/storage/favorite_storage.dart';

class MovieDetailUseCaseImpl extends MovieDetailUseCase {

  final MovieRepository repo;
  final FavoriteStorage favoriteStorage;
  final MovieDetailDTOToMovieDetailMapper mapper;

  MovieDetailUseCaseImpl({
    required this.repo,
    required this.favoriteStorage,
    required this.mapper
  });

  @override
  Future<Result<MovieDetail>> getMovieDetailById(int id) async {
    final result = await Future.wait([
      repo.getMovieDetailById(id),
      favoriteStorage.getFavorite(),
    ]);

    var movieDetail = result[0] as Result<MovieDetailDTO>;
    var favorites = result[1] as List<String>;

    switch(movieDetail) {
      case Success():
        final isFavorite = favorites.contains(movieDetail.data.id.toString());
        final data = mapper.map(movieDetail.data, isFavorite);
        return Result.success(data);
      case Error():
        return Result.error(movieDetail.error);
    }
  }
}