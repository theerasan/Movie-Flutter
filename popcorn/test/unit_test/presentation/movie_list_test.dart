import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popcorn/config/assets_url_config.dart';
import 'package:popcorn/data/repository/movie_repository.dart';
import 'package:popcorn/data/repository/movie_repository_impl.dart';
import 'package:popcorn/data/services/local_movie_service.dart';
import 'package:popcorn/data/services/movie_service.dart';
import 'package:popcorn/data/storage/favorite_storage.dart';
import 'package:popcorn/domain/mapper/movie_list_dto_to_movie_page_data_mapper.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case_impl.dart';
import 'package:popcorn/domain/use_case/movie/movie_list_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_list_use_case_impl.dart';
import 'package:popcorn/domain/use_case/movie/search_movie_list_use_case.dart';
import 'package:popcorn/domain/use_case/movie/search_movie_list_use_case_impl.dart';
import 'package:popcorn/presentation/movie_list/movie_list_state.dart';
import 'package:popcorn/presentation/movie_list/movie_list_viewmodel.dart';

import 'movie_list_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FavoriteStorage>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AssetsUrlConfig config;
  late MovieService service;
  late MovieRepository repo;
  late FavoriteStorage favoriteStorage;
  late MovieFavoriteUseCase favoriteUseCase;
  late MovieListUseCase movieListUseCase;
  late SearchMovieListUseCase movieSearchUseCase;
  late MovieListDTOToMoviePageDataMapper mapper;

  setUp(() {
    config = AssetsUrlConfig();
    service = LocalMovieService();
    repo = MovieRepositoryImpl(service: service);
    favoriteStorage = MockFavoriteStorage();
    mapper = MovieListDTOToMoviePageDataMapper(config: config);
    favoriteUseCase = MovieFavoriteUseCaseImpl(storage: favoriteStorage);
    movieListUseCase = MovieListUseCaseImpl(
      repo: repo,
      mapper: mapper,
      favoriteStorage: favoriteStorage,
    );
    movieSearchUseCase = SearchMovieListUseCaseImpl(
      repo: repo,
      mapper: mapper,
      favoriteStorage: favoriteStorage,
    );

    when(favoriteStorage.getFavorite()).thenAnswer((_) async => ['507244']);
  });

  group("Movie List ViewModel Test", () {
    test(
      """
      Given Users enter movie list screen
      Then Can see list of movie page 1/2
      When Users try to load more
      Then Can see list of movie page 1/2 + 2/2
      When Users try to load more
      Then Can see should retain side
    """,
      () async {
        final sut = MovieListViewModel(
          movieUseCase: movieListUseCase,
          movieFavoriteUseCase: favoriteUseCase,
          searchMovieListUseCase: movieSearchUseCase,
        );

        await sut.onEnterScreen();
        expect(sut.lceElement.result!.maxPage, 2);
        expect(sut.lceElement.result!.page, 1);
        expect(sut.lceElement.result!.movies.length, 10);
        expect(sut.lceElement.result!.movies[0].isFavorite, true);
        expect(sut.lceElement.result!.movies[1].isFavorite, false);

        await sut.loadMore();
        expect(sut.lceElement.result!.maxPage, 2);
        expect(sut.lceElement.result!.page, 2);
        expect(sut.lceElement.result!.movies.length, 16);

        await sut.loadMore();
        expect(sut.lceElement.result!.maxPage, 2);
        expect(sut.lceElement.result!.page, 2);
        expect(sut.lceElement.result!.movies.length, 16);
      },
    );

    test(
      """
      Given Users enter movie list screen
      When add movie to favorite
      Then favorite state should toggle
      AND verify storage update
    """,
      () async {
        final sut = MovieListViewModel(
          movieUseCase: movieListUseCase,
          movieFavoriteUseCase: favoriteUseCase,
          searchMovieListUseCase: movieSearchUseCase,
        );

        await sut.onEnterScreen();
        final movie1 = sut.lceElement.result!.movies[0];
        final movie2 = sut.lceElement.result!.movies[1];

        sut.onClickFavorite(movie1);
        expect(sut.lceElement.result!.movies[0].isFavorite, false);

        sut.onClickFavorite(movie2);
        expect(sut.lceElement.result!.movies[1].isFavorite, true);

        verify(favoriteStorage.removeFromFavorite(movie1.id));
        verify(favoriteStorage.addToFavorite(movie2.id));
      },
    );

    test(
      """
      Given Users enter movie list screen
      When Click search
      Then Search bar is show
      When Users search movie
      Then Can search see list of movie page 1/2
      When Users try to load more
      Then Can see list of movie page 1/2 + 2/2
      When Users close the search bar
      Then Users can see the original list
    """,
      () async {
        final sut = MovieListViewModel(
          movieUseCase: movieListUseCase,
          movieFavoriteUseCase: favoriteUseCase,
          searchMovieListUseCase: movieSearchUseCase,
        );

        await sut.onEnterScreen();
        sut.onClickSearch();
        expect(sut.appBarState.state, MovieListAppBarState.searchBar);

        await sut.search('query');
        expect(sut.lceElement.result!.maxPage, 2);
        expect(sut.lceElement.result!.page, 1);
        expect(sut.lceElement.result!.movies.length, 10);

        await sut.loadMore();
        expect(sut.lceElement.result!.maxPage, 2);
        expect(sut.lceElement.result!.page, 2);
        expect(sut.lceElement.result!.movies.length, 16);

        await sut.onClickCloseSearch();
        expect(sut.lceElement.result!.maxPage, 2);
        expect(sut.lceElement.result!.page, 1);
        expect(sut.lceElement.result!.movies.length, 10);
        expect(sut.appBarState.state, MovieListAppBarState.titleBar);
      },
    );

    test(
      """
      Given click favorite form movie detail screen
      When call update favorite the status should toggle
      """,
      () async {
        final id = 1156594;

        final sut = MovieListViewModel(
          movieUseCase: movieListUseCase,
          movieFavoriteUseCase: favoriteUseCase,
          searchMovieListUseCase: movieSearchUseCase,
        );

        await sut.onEnterScreen();
        expect(sut.lceElement.result!.movies[1].isFavorite, false);

        when(
          favoriteStorage.getFavorite(),
        ).thenAnswer((_) async => [id.toString()]);
        await sut.updateFavoriteById(id);
        expect(sut.lceElement.result!.movies[1].isFavorite, true);
        verify(favoriteStorage.getFavorite());
      },
    );
  });
}
