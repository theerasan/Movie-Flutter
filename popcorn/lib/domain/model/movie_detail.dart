import 'package:popcorn/domain/model/cast.dart';

class MovieDetail {
  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    required this.isAdult,
    required this.casts,
    required this.voteRating,
    required this.mainGenre,
    required this.isFavorite,
  });

  final num id;
  final String title;
  final String overview;
  final String? posterUrl;
  final String? backdropUrl;
  final String releaseDate;
  final String mainGenre;
  final bool isAdult;
  final double voteRating;
  bool isFavorite;
  final List<Cast> casts;
}
