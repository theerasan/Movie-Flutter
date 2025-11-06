import 'package:flutter/cupertino.dart';
import 'package:pop_corn/domain/model/cast.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/domain/use_case/movie/movie_detail_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:pop_corn/ui/lce_element.dart';

class MovieDetailViewModel extends ChangeNotifier {
  int _id = -0;
  final MovieFavoriteUseCase favoriteUseCase;
  final MovieDetailUseCase movieDetailUseCase;
  final LCEElement<MovieDetail> lceElement = LCEElement();

  MovieDetailViewModel({required this.favoriteUseCase, required this.movieDetailUseCase});

  int get getId {
    return _id;
  }

  set setId(int id) {
    _id = id;
    _loadMovieDetail();
  }

  void _loadMovieDetail() {
    lceElement.updateResult(movieDetailUseCase.getMovieDetailById(_id));
  }

  void onClickFavorite(MovieDetail detail) {
    detail.isFavorite = !detail.isFavorite;
    lceElement.update(detail);
  }
}