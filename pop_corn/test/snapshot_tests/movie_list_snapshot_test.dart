// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_screen.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_state.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/ui/core/theme/theme.dart';
import 'package:pop_corn/domain/use_case/movie/movie_list_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/search_movie_list_use_case.dart';
import 'package:pop_corn/util/result.dart';

import '../config/test_devices.dart';
import 'movie_list_snapshot_test.mocks.dart';

@GenerateMocks(<Type>[
  MovieListUseCase,
  MovieFavoriteUseCase,
  SearchMovieListUseCase,
])
void main() {
  testGoldens('Movie List Screen', (tester) async {
    final viewModel = await _givenGetListOfMovie();
    final viewModel2 = viewModel;
    viewModel2.appBarState.state= MovieListAppBarState.SEARCH_BAR;

    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devices,
      )
      ..addScenario(
        name: 'Movie List Default State',
        widget: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(body: MovieListScreen(viewModel: viewModel)),
        ),
      )
      ..addScenario(
        name: 'Movie List Default Search State',
        widget: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(body: MovieListScreen(viewModel: viewModel2)),
        ),
      )
    ;

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'movie_list');
  });
}



Future<MovieListViewModel> _givenGetListOfMovie() async {

  final movieListUseCase = MockMovieListUseCase();
  final movieFavoriteUseCase = MockMovieFavoriteUseCase();
  final searchMovieListUseCase = MockSearchMovieListUseCase();
  final result = Result.success(
    MoviePageData(
      movies: [
        Movie(
          id: 1,
          title: "Titanic",
          posterUrl: null,
          isFavorite: true,
          rating: 4.5,
          releaseDate: '1997-12-26',
          isAdult: false,
        ),
        Movie(
          id: 2,
          title: "Inception",
          posterUrl: null,
          isFavorite: false,
          rating: 4.5,
          releaseDate: '1997-12-26',
          isAdult: true,
        ),
        Movie(
          id: 3,
          title: "Final destination: BLOOD LINE",
          posterUrl: null,
          isFavorite: false,
          rating: 4.5,
          releaseDate: '1997-12-26',
          isAdult: false,
        ),
      ],
      page: 1,
      maxPage: 2,
    ),
  );

  provideDummy<Result<MoviePageData>>(result);
  when(movieListUseCase.getMovies()).thenAnswer((_) async => result);

  final viewModel = MovieListViewModel(
    movieUseCase: movieListUseCase,
    movieFavoriteUseCase: movieFavoriteUseCase,
    searchMovieListUseCase: searchMovieListUseCase,
  );

  return viewModel;
}
