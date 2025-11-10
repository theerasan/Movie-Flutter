import 'package:popcorn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:popcorn/domain/mapper/movie_detail_dto_to_movie_detail_mapper.dart';
import 'package:popcorn/domain/model/movie_detail.dart';
import 'package:popcorn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:popcorn/util/result.dart';

import '../../../data/repository/movie_repository.dart';
import '../../../data/storage/favorite_storage.dart';

class MovieDetailUseCaseImpl extends MovieDetailUseCase {
  final MovieRepository repo;
  final FavoriteStorage favoriteStorage;
  final MovieDetailDTOToMovieDetailMapper mapper;

  MovieDetailUseCaseImpl({
    required this.repo,
    required this.favoriteStorage,
    required this.mapper,
  });

  @override
  Future<Result<MovieDetail>> getMovieDetailById(int id) async {
    return _loadMovieDetailById(id);
  }

  Future<Result<MovieDetail>> _loadMovieDetailById(int id) async {
    final data = await Future.wait([
      repo.getMovieDetailById(id),
      favoriteStorage.getFavorite(),
    ]);

    var result = data[0] as Result<MovieDetailDTO>;
    var favorites = data[1] as List<String>;

    switch (result) {
      case Success<MovieDetailDTO>():
        final isFavorite = favorites.contains(result.data.id.toString());
        final mapped = mapper.map(result.data, isFavorite);
        return Result.success(mapped);
      case Error<MovieDetailDTO>():
        return Result.error(result.error);
    }
  }
}
