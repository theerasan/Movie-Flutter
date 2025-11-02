import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/presentation/movie_list/movie_card.dart';
import 'package:pop_corn/presentation/movie_list/movie_list_viewmodel.dart';
import 'package:pop_corn/routing/routes.dart';

class MovieList extends StatefulWidget {

  final MovieListViewModel viewModel;
  const MovieList({
    super.key,
    required this.viewModel
  });

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  void _onClickMovieItem(num id) {
    context.push(Routes.movieDetailWithId(id));
  }

  @override
  Widget build(BuildContext context) {
    final movies = widget.viewModel.movies;
    final appBar = AppBar(
      title: Text('Movie'),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            final movie = movies[index];
            return MovieCard(
              movie: movie,
              onClickMovieItem: () {
                _onClickMovieItem(movie.id);
              }
            );
          }
        ),
      );
  }
}