import 'package:flutter/cupertino.dart';
import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/domain/use_case/movie/movie_use_case.dart';
import 'package:pop_corn/domain/model/movie.dart';
import 'package:pop_corn/ui/lce_element.dart';
import 'package:pop_corn/util/result.dart';

class MovieListViewModel extends ChangeNotifier {

  final MovieUseCase movieUseCase;
  LCEElement<MoviePageData> movies = LCEElement();
  bool isLoadMore = false;

  MovieListViewModel({required this.movieUseCase});

  void onEnterScreen() {
    movieUseCase.log();
    movies.updateResult(movieUseCase.getMovies());
  }

  void loadMore() {
    print("load more");
    movies.updateResult(movieUseCase.loadMoreMovies());
  }
}