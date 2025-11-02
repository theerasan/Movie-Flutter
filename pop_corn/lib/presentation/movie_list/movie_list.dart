import 'package:flutter/material.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';

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
    return ListView.builder(
      itemCount:  widget.movies.length,
      itemBuilder: (ctx, index) => Text(widget.movies[index].title)
    );
  }
}