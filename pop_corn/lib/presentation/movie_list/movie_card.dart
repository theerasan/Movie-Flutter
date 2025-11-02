import 'package:flutter/material.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onClickMovieItem,
  });

  final Movie movie;
  final Function() onClickMovieItem;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    var icon = Icons.favorite_border_rounded;
    if (widget.movie.isFavorite) {
      icon = Icons.favorite;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onClickMovieItem,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child:Image.network(widget.movie.posterUrl),
            ),
            Expanded(
              flex: 7,
              child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(icon)
                    ),
                    Text(widget.movie.title),
                    Text(widget.movie.releaseDate),
                  ]
              ),
            ),
          ],
        ),
      )
    );
  }
}