import 'package:flutter/material.dart';
import 'package:popcorn/domain/model/movie_detail.dart';

import '../../l10n/app_localizations.dart';
import '../../ui/core/sizing.dart';
import 'movie_detail_body.dart';
import 'movie_detail_cast.dart';
import 'movie_detail_header.dart';

class MovieDetailSingleColumn extends StatelessWidget {
  final MovieDetail movie;
  final ScrollController scrollController;

  const MovieDetailSingleColumn({
    super.key,
    required this.movie,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.zero,
      children: [
        MovieDetailHeader(movie: movie),
        BoxSizing.xxl,
        MovieDetailBody(overview: movie.overview),
        BoxSizing.xxl,
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: AppSizing.xxl),
          child: Text(
            AppLocalizations.of(context)!.movie_detail_cast,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        BoxSizing.m,
        ...movie.casts.map(
          (cast) => MovieDetailCast(key: ValueKey(cast.id), cast: cast),
        ),
        BoxSizing.xxl,
      ],
    );
  }
}
