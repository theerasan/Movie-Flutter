import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/ui/core/sizing.dart';
import 'package:pop_corn/ui/genre_label.dart';
import 'package:pop_corn/ui/movie_cover.dart';
import 'package:pop_corn/ui/rate_label.dart';
import 'package:pop_corn/ui/release_date_label.dart';
import 'package:pop_corn/ui/vote_label.dart';

class MovieDetailHeader extends StatelessWidget {

  const MovieDetailHeader({super.key, required this.movie});

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    final startColor = Theme.of(context).colorScheme.surface.withValues(alpha: 0);
    final endColor = Theme.of(context).colorScheme.surface.withValues(alpha: 1);
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double headerHeight = statusBarHeight + 380.0;

    if (MediaQuery.of(context).size.width > AppSizing.smallBreakPoint) {
      statusBarHeight /= 2;
      headerHeight = MediaQuery.of(context).size.height;
    }

    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            height: headerHeight,
            child: MovieCover(
              height: headerHeight,
              path: movie.backdropUrl,
              placeholder: 'images/backdrop_placeholder.png',
            ),
          ),
          Container(
            height: headerHeight,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  startColor,
                  endColor,
                ],
                radius: 1,
                stops: const [
                  0.0,
                  0.6,
                ],
                center: Alignment.center
              )
            )
          ),
          Container(
            height: headerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  startColor,
                  endColor
                ],
                stops: [
                  0.75,
                  0.85
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            )
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: statusBarHeight,),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: AppSizing.coverLarge,
                    child: MovieCover(
                        path: movie.posterUrl,
                        placeholder: 'images/poster_placeholder.png'
                    ),
                  ),
                ),
                BoxSizing.l,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReleaseDateLabel(releaseDate: movie.releaseDate,),
                    BoxSizing.l,
                    RateLabel(isAdult: movie.isAdult,),
                    BoxSizing.l,
                    GenreLabel(genre: movie.mainGenre)
                  ],
                ),
                BoxSizing.s,
                VoteLabel(rating: movie.voteRating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
