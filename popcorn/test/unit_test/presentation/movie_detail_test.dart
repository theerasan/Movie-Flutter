import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popcorn/config/assets_url_config.dart';
import 'package:popcorn/data/repository/movie_repository.dart';
import 'package:popcorn/data/repository/movie_repository_impl.dart';
import 'package:popcorn/data/services/local_movie_service.dart';
import 'package:popcorn/data/services/movie_service.dart';
import 'package:popcorn/data/storage/favorite_storage.dart';
import 'package:popcorn/domain/mapper/movie_detail_dto_to_movie_detail_mapper.dart';
import 'package:popcorn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_detail_use_case_impl.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case_impl.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_viewmodel.dart';

import 'movie_list_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteStorage>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AssetsUrlConfig config;
  late MovieService service;
  late MovieRepository repo;
  late FavoriteStorage favoriteStorage;
  late MovieFavoriteUseCase favoriteUseCase;
  late MovieDetailUseCase movieDetailUseCase;
  late MovieDetailDTOToMovieDetailMapper mapper;

  setUp(() {
    config = AssetsUrlConfig();
    service = LocalMovieService();
    repo = MovieRepositoryImpl(service: service);
    favoriteStorage = MockFavoriteStorage();
    mapper = MovieDetailDTOToMovieDetailMapper(config: config);
    favoriteUseCase = MovieFavoriteUseCaseImpl(storage: favoriteStorage);
    movieDetailUseCase = MovieDetailUseCaseImpl(
      repo: repo,
      mapper: mapper,
      favoriteStorage: favoriteStorage,
    );

    when(favoriteStorage.getFavorite()).thenAnswer((_) async => ['507244']);
  });

  group("Movie Detail ViewModel Test", () {
    test(
      """
      Given user access the movie list screen
      Then can see screen
      AND can toggle favorite
    """,
      () async {
        final sut = MovieDetailViewModel(
          movieFavoriteUseCase: favoriteUseCase,
          movieDetailUseCase: movieDetailUseCase,
        );

        await sut.setId(-1);
        expect(sut.lceElement.error, true);

        await sut.setId(1);
        final movie = sut.lceElement.result!;
        expect(movie.title, 'Weapons');
        expect(movie.isFavorite, false);
        expect(sut.lceElement.error, false);

        await sut.onClickFavorite(sut.lceElement.result!);
        expect(sut.lceElement.result!.isFavorite, true);

        verify(favoriteStorage.addToFavorite(movie.id));

        await sut.onClickFavorite(sut.lceElement.result!);
        expect(sut.lceElement.result!.isFavorite, false);
        verify(favoriteStorage.removeFromFavorite(movie.id));
        verify(favoriteStorage.getFavorite());
      },
    );
  });
}
