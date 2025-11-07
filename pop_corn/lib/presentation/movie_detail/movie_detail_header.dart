import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
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
    final centerColor = Theme.of(context).colorScheme.surface.withValues(alpha: 1);
    
    var headerHeight = 500.0;
    if (Platform.isIOS) {
      headerHeight = 500.0;
    }
    if (Platform.isAndroid) {
      headerHeight = 460.0;
    }

    return SizedBox(
      height: headerHeight,
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
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  startColor,
                  centerColor,
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
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                          height: 285,
                          child: MovieCover(
                              path: movie.posterUrl,
                              placeholder: 'images/poster_placeholder.png'
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReleaseDateLabel(releaseDate: movie.releaseDate,),
                      SizedBox(width: 16,),
                      RateLabel(isAdult: movie.isAdult,),
                      SizedBox(width: 16,),
                      GenreLabel(genre: movie.mainGenre)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Center(
                    child: VoteLabel(rating: movie.voteRating),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
