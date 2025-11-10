import 'package:flutter/cupertino.dart';
import 'package:popcorn/domain/model/movie_page_data.dart';
import 'package:popcorn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:popcorn/domain/use_case/movie/movie_list_use_case.dart';
import 'package:popcorn/domain/model/movie.dart';
import 'package:popcorn/presentation/movie_list/movie_list_state.dart';
import 'package:popcorn/ui/lce_element.dart';

import '../../domain/use_case/movie/search_movie_list_use_case.dart';

class MovieListViewModel extends ChangeNotifier {
  final MovieListUseCase movieUseCase;
  final MovieFavoriteUseCase movieFavoriteUseCase;
  final SearchMovieListUseCase searchMovieListUseCase;
  LCEElement<MoviePageData> lceElement = LCEElement();
  MovieListState appBarState = MovieListState(
    state: MovieListAppBarState.titleBar,
    query: "",
  );

  bool isLoadMore = false;

  MovieListViewModel({
    required this.movieUseCase,
    required this.movieFavoriteUseCase,
    required this.searchMovieListUseCase,
  });

  Future onEnterScreen() async {
    lceElement.clearResult();
    return lceElement.updateResult(movieUseCase.getMovies());
  }

  Future loadMore() async {
    var pageData = (lceElement.result as MoviePageData);
    if (pageData.hasNextPage()) {
      lceElement.showLoading();
      switch (appBarState.state) {
        case MovieListAppBarState.titleBar:
          return lceElement.updateResult(movieUseCase.loadMoreMovies());
        case MovieListAppBarState.searchBar:
          return lceElement.updateResult(
            searchMovieListUseCase.loadMoreMovies(),
          );
      }
    }
  }

  void onClickFavorite(Movie movie) {
    if (movie.isFavorite) {
      movieFavoriteUseCase.removeFromFavorite(movie.id);
    } else {
      movieFavoriteUseCase.addToFavorite(movie.id);
    }
    _updateFavorite(movie.id, !movie.isFavorite);
  }

  void _updateFavorite(num id, bool value) async {
    var pageData = (lceElement.result as MoviePageData);
    var index = pageData.movies.indexWhere((element) => element.id == id);
    pageData.movies[index].isFavorite = value;
    notifyListeners();
  }

  void onClickSearch() {
    appBarState.state = MovieListAppBarState.searchBar;
    notifyListeners();
  }

  Future onClickCloseSearch() async {
    appBarState.state = MovieListAppBarState.titleBar;
    appBarState.query = "";
    notifyListeners();
    lceElement.clearResult();
    return lceElement.updateResult(movieUseCase.getMovies());
  }

  Future search(String query) async {
    if (query.isNotEmpty) {
      if (query.startsWith(appBarState.query)) {
        lceElement.showLoading();
      } else {
        lceElement.clearResult();
        lceElement.showLoading();
      }
      appBarState.query = query;
      return lceElement.updateResult(searchMovieListUseCase.getMovies(query));
    }
  }

  Future updateFavoriteById(num id) async {
    final favorite = await movieFavoriteUseCase.getFavoriteStatus(id);
    return _updateFavorite(id, favorite);
  }
}
