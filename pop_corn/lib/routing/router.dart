import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/presentation/movie_detail/movie_detail.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';
import 'package:pop_corn/presentation/movie_list/movie_list.dart';
import 'package:pop_corn/routing/routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.movieList,
  routes: [
    GoRoute(
      path: Routes.movieList,
      builder: (context, state) {
        return MovieList(movies: [
          Movie(id: 1, title: "title_1"),
          Movie(id: 2, title: "title_2"),
          Movie(id: 3, title: "title_3"),
          Movie(id: 4, title: "title_4"),
          Movie(id: 5, title: "title_5"),
          Movie(id: 6, title: "title_6"),
          Movie(id: 7, title: "title_7"),
          Movie(id: 8, title: "title_8"),
          Movie(id: 9, title: "title_9"),
          Movie(id: 10, title: "title_10"),
        ]);
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