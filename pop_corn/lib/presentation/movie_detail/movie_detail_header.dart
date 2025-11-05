import 'package:flutter/material.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/ui/genre_label.dart';
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

    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          FadeInImage(
            image: NetworkImage(movie.backdropUrl),
            colorBlendMode: BlendMode.modulate,
            height: 500,
            fit: BoxFit.cover,
            placeholder: const AssetImage(
                'images/backdrop_placeholder.png',
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
                        child: FadeInImage(
                          height: 285,
                          image: NetworkImage(movie.posterUrl),
                          placeholder: const AssetImage('images/poster_placeholder.png'),
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