import 'package:flutter/material.dart';
import 'package:popcorn/domain/model/movie.dart';
import 'package:popcorn/ui/core/sizing.dart';
import 'package:popcorn/ui/movie_cover.dart';
import 'package:popcorn/ui/release_date_label.dart';
import 'package:popcorn/ui/vote_label.dart';
import 'package:popcorn/ui/core/theme/colors.dart';
import 'package:popcorn/ui/rate_label.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onClickMovieItem,
    required this.onClickFavorite,
  });

  final Movie movie;
  final Function() onClickMovieItem;
  final Function() onClickFavorite;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  late final movieTitle = Column(
    children: [
      BoxSizing.s,
      Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 70,
              child: Text(
                widget.movie.title,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ],
  );

  late final ratingAndVote = Row(
    children: [
      RateLabel(isAdult: widget.movie.isAdult),
      BoxSizing.s,
      VoteLabel(rating: widget.movie.rating),
    ],
  );

  @override
  Widget build(BuildContext context) {
    var icon = Icons.favorite_border_rounded;
    if (widget.movie.isFavorite) {
      icon = Icons.favorite;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: widget.onClickMovieItem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: AppSizing.coverSmall,
                child: MovieCover(
                  path: widget.movie.posterUrl,
                  placeholder: 'images/poster_placeholder.png',
                ),
              ),
            ),
            BoxSizing.m,
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  movieTitle,
                  Column(
                    children: [
                      ratingAndVote,
                      BoxSizing.m,
                      ReleaseDateLabel(releaseDate: widget.movie.releaseDate),
                      BoxSizing.s,
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: widget.onClickFavorite,
              icon: Icon(icon, color: AppColors.favColor),
            ),
          ],
        ),
      ),
    );
  }
}
