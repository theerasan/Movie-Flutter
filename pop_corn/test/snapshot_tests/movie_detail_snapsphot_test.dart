import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pop_corn/domain/model/cast.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_screen.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail_viewmodel.dart';
import 'package:pop_corn/ui/core/theme/theme.dart';
import 'package:pop_corn/util/result.dart';

import '../config/test_devices.dart';
import 'movie_detail_snapsphot_test.mocks.dart';

@GenerateMocks(<Type>[
  MovieDetailUseCase,
  MovieFavoriteUseCase,
])
void main() {
  testGoldens('Movie Detail', (tester) async {
    final viewModel = _givenGetMovieDetail();
    await loadAppFonts();

    viewModel.setId = 1;

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: devices,
      )
      ..addScenario(
        widget: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Scaffold(body: MovieDetailScreen(viewModel: viewModel, id: 1)),
        )
      )
    ;

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'movie_detail');
  });
}

MovieDetailViewModel _givenGetMovieDetail() {
  final movieDetailUseCase = MockMovieDetailUseCase();
  final movieFavoriteUseCase = MockMovieFavoriteUseCase();

  final result = Result.success(
    MovieDetail(
      id: 1,
      title: 'One Piece: RED film',
      overview: 'Monkey D. Luffy, a young man with rubber-like powers, who gathers a diverse crew called the Straw Hat Pirates to sail the treacherous seas in search of the legendary treasure known as the "One Piece".',
      posterUrl: null,
      backdropUrl: null,
      releaseDate: '1996',
      mainGenre: 'action',
      voteRating: 4.7,
      isFavorite: true,
      isAdult: false,
      casts: [
        Cast(
          fullName: 'Monkey D. Luffy',
          character: 'Captain'
        ),
        Cast(
            fullName: 'Tony Tony Chopper',
            character: 'Doctor'
        )
      ],
    )
  );

  provideDummy<Result<MovieDetail>>(result);
  when(movieDetailUseCase.getMovieDetailById(any)).thenAnswer((_) async => result);

  var viewModel = MovieDetailViewModel(
    movieDetailUseCase: movieDetailUseCase,
    movieFavoriteUseCase: movieFavoriteUseCase,
  );

  return viewModel;
}