import 'package:flutter/cupertino.dart';
import 'package:popcorn/domain/model/movie_detail.dart';
import 'package:popcorn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:popcorn/ui/lce_element.dart';

class MovieDetailViewModel extends ChangeNotifier {
  int _id = -1;
  final MovieFavoriteUseCase movieFavoriteUseCase;
  final MovieDetailUseCase movieDetailUseCase;
  LCEElement<MovieDetail> lceElement = LCEElement();

  MovieDetailViewModel({
    required this.movieFavoriteUseCase,
    required this.movieDetailUseCase,
  });

  Future setId(int id) async {
    _id = id;
    return _loadMovieDetail();
  }

  Future _loadMovieDetail() async {
    lceElement.clearResult();
    return lceElement.updateResult(movieDetailUseCase.getMovieDetailById(_id));
  }

  Future onClickFavorite(MovieDetail movie) {
    if (movie.isFavorite) {
      movieFavoriteUseCase.removeFromFavorite(movie.id);
    } else {
      movieFavoriteUseCase.addToFavorite(movie.id);
    }
    movie.isFavorite = !movie.isFavorite;
    return lceElement.update(movie);
  }

  void onRetry() {
    _loadMovieDetail();
  }
}
