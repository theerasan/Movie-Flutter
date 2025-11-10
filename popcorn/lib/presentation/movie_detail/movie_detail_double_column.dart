import 'package:flutter/material.dart';
import 'package:popcorn/domain/model/movie_detail.dart';

import '../../l10n/app_localizations.dart';
import '../../ui/core/sizing.dart';
import 'movie_detail_body.dart';
import 'movie_detail_cast.dart';
import 'movie_detail_header.dart';

class MovieDetailDoubleColumn extends StatelessWidget {
  final MovieDetail movie;

  const MovieDetailDoubleColumn({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: MovieDetailHeader(movie: movie)),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppSizing.xxl,
                ),
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              BoxSizing.xxl,
              MovieDetailBody(overview: movie.overview),
              BoxSizing.xxl,
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppSizing.xxl,
                ),
                child: Text(
                  AppLocalizations.of(context)!.movie_detail_cast,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              BoxSizing.m,
              ...movie.casts.map((cast) => MovieDetailCast(cast: cast)),
            ],
          ),
        ),
      ],
    );
  }
}
