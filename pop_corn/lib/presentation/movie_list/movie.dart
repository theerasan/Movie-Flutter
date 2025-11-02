class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.isFavorite,
    required this.rating,
    required this.releaseDate,
  });

  final num id;
  final String title;
  final String posterUrl;
  final bool isFavorite;
  final double rating;
  final String releaseDate;
}