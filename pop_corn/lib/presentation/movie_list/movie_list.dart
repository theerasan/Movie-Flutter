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

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        widget.viewModel.loadMore();
      }
    });
  }

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

    final width = MediaQuery.of(context).size.width;
    var column = 1;
    if (width > 600 ) {
      column = 2;
    }

    return Scaffold(
      appBar: appBar,
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, _) {
          return GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: column,
                childAspectRatio: width / column / 155
            ),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];
              return MovieCard(
                  movie: movie,
                  onClickMovieItem: () {
                    _onClickMovieItem(movie.id);
                  }
              );
            }
          );
        },
      )
    );
  }
}