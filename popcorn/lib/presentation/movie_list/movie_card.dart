import 'package:flutter/material.dart';
import 'package:popcorn/domain/model/movie.dart';
import 'package:popcorn/ui/core/sizing.dart';
import 'package:popcorn/ui/movie_cover.dart';
import 'package:popcorn/ui/release_date_label.dart';
import 'package:popcorn/ui/vote_label.dart';
import 'package:popcorn/ui/rate_label.dart';

import '../../ui/favorite_button.dart';

class MovieCard extends StatelessWidget {
  MovieCard({
    super.key,
    required this.movie,
    required this.onClickMovieItem,
    required this.onClickFavorite,
  });

  final Movie movie;
  final Function() onClickMovieItem;
  final Function() onClickFavorite;

  late final ratingAndVote = Row(
    children: [
      RateLabel(isAdult: movie.isAdult),
      BoxSizing.s,
      VoteLabel(rating: movie.rating),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: onClickMovieItem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: AppSizing.coverSmall,
                child: MovieCover(
                  path: movie.posterUrl,
                  placeholder: 'images/poster_placeholder.png',
                ),
              ),
            ),
            BoxSizing.m,
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: AppSizing.m),
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    children: [
                      ratingAndVote,
                      BoxSizing.m,
                      ReleaseDateLabel(releaseDate: movie.releaseDate),
                      BoxSizing.s,
                    ],
                  ),
                ],
              ),
            ),
            FavoriteButton(
              isFavorite: movie.isFavorite,
              onClickFavorite: onClickFavorite,
            ),
          ],
        ),
      ),
    );
  }
}
