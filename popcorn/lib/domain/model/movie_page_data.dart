import 'package:popcorn/domain/model/movie.dart';

class MoviePageData {
  const MoviePageData({
    required this.movies,
    required this.page,
    required this.maxPage,
  });

  final List<Movie> movies;
  final int page;
  final int maxPage;

  bool hasNextPage() {
    return page < maxPage;
  }
}
