
abstract final class Routes {
  static const movieList = '/';
  static const search = '/search';
  static const movieDetailPath = '/movie-detail';
  static const movieDetail = '$movieDetailPath/:id';
  static String movieDetailWithId(num id) => '$movieDetailPath/$id';
}
