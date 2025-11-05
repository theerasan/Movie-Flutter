import 'package:pop_corn/domain/model/cast.dart';

class MovieDetail {
  MovieDetail({
    required this.id,
    required this.title,
    required this.overView,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    required this.isAdult,
    required this.casts,
    required this.voteRating,
    required this.mainGenre
  });

  final num id;
  final String title;
  final String overView;
  final String posterUrl;
  final String backdropUrl;
  final String releaseDate;
  final String mainGenre;
  final bool isAdult;
  final double voteRating;
  final List<Cast> casts;
}