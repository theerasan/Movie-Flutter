import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';
import 'package:pop_corn/routing/routes.dart';

class MovieList extends StatefulWidget {

  final List<Movie> movies;
  const MovieList({
    super.key,
    required this.movies
  });

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:  widget.movies.length,
        itemBuilder: (ctx, index) => OutlinedButton(
            onPressed: () {
              context.push(Routes.movieDetailWithId(widget.movies[index].id));
            },
            child: Text(widget.movies[index].title)
        ),
      ),
    );
  }
}