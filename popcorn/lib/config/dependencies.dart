import 'package:popcorn/config/assets_url_config.dart';
import 'package:popcorn/data/repository/movie_repository.dart';
import 'package:popcorn/data/repository/movie_repository_impl.dart';
import 'package:popcorn/data/services/local_movie_service.dart';
import 'package:popcorn/data/services/movie_service.dart';
import 'package:popcorn/data/services/remote_movie_service.dart';
import 'package:popcorn/data/storage/favorite_share_pref_storage.dart';
import 'package:popcorn/data/storage/favorite_storage.dart';
import 'package:popcorn/domain/mapper/movie_detail_dto_to_movie_detail_mapper.dart';
import 'package:popcorn/domain/mapper/movie_list_dto_to_movie_page_data_mapper.dart';
import 'package:popcorn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_detail_use_case_impl.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case_impl.dart';
import 'package:popcorn/domain/use_case/movie/movie_list_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_list_use_case_impl.dart';
import 'package:popcorn/domain/use_case/movie/search_movie_list_use_case.dart';
import 'package:popcorn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:popcorn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../domain/use_case/movie/search_movie_list_use_case_impl.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _configProviders = [
  Provider(create: (ctx) => AssetsUrlConfig()),
];

List<SingleChildWidget> _storageProviders = [
  Provider<FavoriteStorage>(create: (ctx) => FavoriteSharePrefStorage()),
];
List<SingleChildWidget> _mapperProviders = [
  Provider(
    create: (ctx) => MovieListDTOToMoviePageDataMapper(config: ctx.read()),
  ),
  Provider(
    create: (ctx) => MovieDetailDTOToMovieDetailMapper(config: ctx.read()),
  ),
];

List<SingleChildWidget> _repoProviders = [
  Provider<MovieRepository>(
    create: (ctx) => MovieRepositoryImpl(service: ctx.read()),
  ),
];

List<SingleChildWidget> _useCaseProviders = [
  Provider<MovieListUseCase>(
    create: (ctx) => MovieListUseCaseImpl(
      repo: ctx.read(),
      mapper: ctx.read(),
      favoriteStorage: ctx.read(),
    ),
  ),
  Provider<SearchMovieListUseCase>(
    create: (ctx) => SearchMovieListUseCaseImpl(
      repo: ctx.read(),
      mapper: ctx.read(),
      favoriteStorage: ctx.read(),
    ),
  ),
  Provider<MovieDetailUseCase>(
    create: (ctx) => MovieDetailUseCaseImpl(
      repo: ctx.read(),
      favoriteStorage: ctx.read(),
      mapper: ctx.read(),
    ),
  ),
  Provider<MovieFavoriteUseCase>(
    create: (ctx) => MovieFavoriteUseCaseImpl(storage: ctx.read()),
  ),
];

List<SingleChildWidget> _viewModelProviders = [
  ChangeNotifierProvider<MovieListViewModel>(
    create: (ctx) => MovieListViewModel(
      movieUseCase: ctx.read(),
      movieFavoriteUseCase: ctx.read(),
      searchMovieListUseCase: ctx.read(),
    ),
  ),
  ChangeNotifierProvider<MovieDetailViewModel>(
    create: (ctx) => MovieDetailViewModel(
      movieFavoriteUseCase: ctx.read(),
      movieDetailUseCase: ctx.read(),
    ),
  ),
];

List<SingleChildWidget> _sharedProviders = [
  ..._configProviders,
  ..._storageProviders,
  ..._mapperProviders,
  ..._repoProviders,
  ..._useCaseProviders,
  ..._viewModelProviders,
];

/// Provide for remote
List<SingleChildWidget> get providersRemote {
  return [
    Provider<MovieService>(create: (ctx) => RemoteMovieService()),
    ..._sharedProviders,
  ];
}

/// Provide for local
List<SingleChildWidget> get providersLocal {
  return [
    Provider<MovieService>(create: (ctx) => LocalMovieService()),
    ..._sharedProviders,
  ];
}
