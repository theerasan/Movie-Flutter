import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/domain/use_case/movie/movie_use_case.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail.dart';
import 'package:pop_corn/presentation/movie_list/movie_list.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/routing/routes.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.movieList,
  routes: [
    GoRoute(
      path: Routes.movieList,
      builder: (context, state) {
        final viewModel = MovieListViewModel(
          movieUseCase: context.read<MovieUseCase>()
        );
        return MovieList(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.movieDetail,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return MovieDetail(id: id);
      }
    )
  ]
);