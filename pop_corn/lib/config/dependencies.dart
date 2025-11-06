import 'package:pop_corn/config/assets_url_config.dart';
import 'package:pop_corn/data/repository/movie_repository.dart';
import 'package:pop_corn/data/repository/movie_repository_impl.dart';
import 'package:pop_corn/data/services/local_movie_service.dart';
import 'package:pop_corn/data/services/movie_service.dart';
import 'package:pop_corn/data/services/remote_movie_service.dart';
import 'package:pop_corn/data/storage/favorite_share_pref_storage.dart';
import 'package:pop_corn/data/storage/favorite_storage.dart';
import 'package:pop_corn/domain/mapper/movie_detail_dto_to_movie_detail_mapper.dart';
import 'package:pop_corn/domain/mapper/movie_dto_to_movie_page_data_mapper.dart';
import 'package:pop_corn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_detail_use_case_impl.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case_impl.dart';
import 'package:pop_corn/domain/use_case/movie/movie_list_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_list_use_case_impl.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
  Provider<FavoriteStorage>(create: (ctx) => FavoriteSharePrefStorage()),
  Provider(create: (ctx) => AssetsUrlConfig()),
  Provider(create: (ctx) => MovieDTOToMoviePageDataMapper(config: ctx.read())),
  Provider(create: (ctx) => MovieDetailDTOToMovieDetailMapper(config: ctx.read())),
  Provider<MovieRepository>(
    create: (ctx) => MovieRepositoryImpl(service: ctx.read()),
  ),
  Provider<MovieListUseCase>(
    create: (ctx) => MovieListUseCaseImpl(repo: ctx.read(), mapper: ctx.read(), favoriteStorage: ctx.read()),
  ),
  Provider<MovieDetailUseCase>(create: (ctx) => MovieDetailUseCaseImpl(repo: ctx.read(), favoriteStorage: ctx.read(), mapper: ctx.read())),
  Provider<MovieFavoriteUseCase>(create: (ctx) => MovieFavoriteUseCaseImpl(storage: ctx.read())),
  ChangeNotifierProvider<MovieListViewModel>(create: (ctx) => MovieListViewModel(movieUseCase: ctx.read(), movieFavoriteUseCase: ctx.read())),
  ChangeNotifierProvider<MovieDetailViewModel>(create: (ctx) => MovieDetailViewModel(favoriteUseCase: ctx.read(), movieDetailUseCase: ctx.read()))
];

/// Provide for remote
List<SingleChildWidget> get providersRemote {
  return [
    Provider<MovieService>(create: (ctx) => RemoteMovieService()),
    ..._sharedProviders
  ];
}

/// Provide for local
List<SingleChildWidget> get providersLocal {
  return [
    Provider<MovieService>(create: (ctx) => LocalMovieService()),
    ..._sharedProviders
  ];
}