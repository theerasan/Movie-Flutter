import 'package:pop_corn/config/assets_url_config.dart';
import 'package:pop_corn/data/repository/movie_repository.dart';
import 'package:pop_corn/data/repository/movie_repository_impl.dart';
import 'package:pop_corn/data/services/local_movie_service.dart';
import 'package:pop_corn/data/services/movie_service.dart';
import 'package:pop_corn/data/services/remote_movie_service.dart';
import 'package:pop_corn/domain/mapper/movie_dto_to_movie_page_data_mapper.dart';
import 'package:pop_corn/domain/use_case/movie/movie_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_use_case_impl.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
  Provider(create: (ctx) => AssetsUrlConfig()),
  Provider(create: (ctx) => MovieDTOToMoviePageDataMapper(config: ctx.read())),
  Provider<MovieRepository>(
    create: (ctx) => MovieRepositoryImpl(service: ctx.read()),
  ),
  Provider<MovieUseCase>(
    create: (ctx) => MovieUseCaseImpl(repo: ctx.read(), mapper: ctx.read()),
  ),
  ChangeNotifierProvider<MovieListViewModel>(create: (ctx) => MovieListViewModel(movieUseCase: ctx.read()))
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