import 'package:flutter/cupertino.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:pop_corn/domain/use_case/movie/movie_list_use_case.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:pop_corn/ui/lce_element.dart';
import 'package:pop_corn/util/result.dart';

class MovieListViewModel extends ChangeNotifier {

  final MovieListUseCase movieUseCase;
  final MovieFavoriteUseCase movieFavoriteUseCase;
  LCEElement<MoviePageData> movies = LCEElement();
  bool isLoadMore = false;

  MovieListViewModel({required this.movieUseCase, required this.movieFavoriteUseCase});

  void onEnterScreen() {
    movieUseCase.log();
    movies.updateResult(movieUseCase.getMovies());
  }

  void loadMore() {
    movies.updateResult(movieUseCase.loadMoreMovies());
  }

  void onClickFavorite(Movie movie) {
    if (movie.isFavorite) {
      movieFavoriteUseCase.removeFromFavorite(movie.id);
    } else {
      movieFavoriteUseCase.addToFavorite(movie.id);
    }
    _toggleFavorite(movie);
  }

  void _toggleFavorite(Movie movie) {
    var movieList = (movies.result as MoviePageData);
    var index = movieList.movies.indexWhere((element) => element.id == movie.id);
    movieList.movies[index].isFavorite = !movie.isFavorite;
    notifyListeners();
  }
}