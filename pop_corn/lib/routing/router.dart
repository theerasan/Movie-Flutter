import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';
import 'package:pop_corn/presentation/movie_list/movie_list.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/routing/routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.movieList,
  routes: [
    GoRoute(
      path: Routes.movieList,
      builder: (context, state) {
        final viewModel = MovieListViewModel();
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