import 'package:pop_corn/domain/model/movie.dart';

class MoviePageData {
  const MoviePageData({required this.movies, required this.page, required this.maxPage});

  final List<Movie> movies;
  final int page;
  final int maxPage;
}