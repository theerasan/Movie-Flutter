import 'package:flutter_test/flutter_test.dart';
import 'package:popcorn/data/model/movie_detail/movie_detail_dto.dart';
import 'package:popcorn/data/model/movie_list/movie_list_dto.dart';
import 'package:popcorn/data/repository/movie_repository_impl.dart';
import 'package:popcorn/data/services/local_movie_service.dart';
import 'package:popcorn/util/result.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final service = LocalMovieService();
  final repo = MovieRepositoryImpl(service: service);

  group('MovieRepository test', () {
    test('Can get movie detail', () async {
      final movie = await service.getMovieDetailById(1);
      final movieDetail = await repo.getMovieDetailById(1);
      expect(movie.title, 'Weapons');
      expect(movieDetail, isA<Success<MovieDetailDTO>>());
      expect((movieDetail as Success<MovieDetailDTO>).data, movie);
    });

    test('Can get movie detail with error', () async {
      final movieDetail = await repo.getMovieDetailById(-1);
      expect(movieDetail, isA<Error<MovieDetailDTO>>());
    });

    test('Can get movie list', () async {
      final movieList = await service.getMovies(1);
      final movieListResult = await repo.getMovies(1);

      expect(movieListResult, isA<Success<MovieListDTO>>());
      expect((movieListResult as Success<MovieListDTO>).data, movieList);
    });

    test('Can get movie list with error', () async {
      final movieListResult = await repo.getMovies(-1);

      expect(movieListResult, isA<Error<MovieListDTO>>());
    });

    test('Can search movie list', () async {
      final movieList = await service.searchMovies('', 1);
      final movieListResult = await repo.searchMovies('', 1);

      expect(movieListResult, isA<Success<MovieListDTO>>());
      expect((movieListResult as Success<MovieListDTO>).data, movieList);
    });

    test('Can search movie list', () async {
      final movieListResult = await repo.searchMovies('', -1);

      expect(movieListResult, isA<Error<MovieListDTO>>());
    });
  });
}
