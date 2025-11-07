class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.isFavorite,
    required this.rating,
    required this.releaseDate,
    required this.isAdult,
  });

  final num id;
  final String title;
  String? posterUrl;
  bool isFavorite;
  final double rating;
  final String releaseDate;
  final bool isAdult;
}