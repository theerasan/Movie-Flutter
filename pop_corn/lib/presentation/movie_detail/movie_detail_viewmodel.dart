import 'package:flutter/cupertino.dart';
import 'package:pop_corn/domain/model/cast.dart';
import 'package:pop_corn/domain/model/movie_detail.dart';
import 'package:pop_corn/domain/use_case/movie/movie_favorite_use_case.dart';
import 'package:pop_corn/ui/lce_element.dart';

class MovieDetailViewModel extends ChangeNotifier {
  int _id = -0;
  final MovieFavoriteUseCase favoriteUseCase;
  final LCEElement<MovieDetail> lceElement = LCEElement();

  MovieDetailViewModel({required this.favoriteUseCase});

  int get getId {
    return _id;
  }

  set setId(int id) {
    _id = id;
    _loadMovieDetail();
  }

  void _loadMovieDetail() {
    lceElement.update(
      MovieDetail(
        id: 1,
        title: "title",
        overView: "overView",
        posterUrl: "https://media.themoviedb.org/t/p/w220_and_h330_face/xeEw3eLeSFmJgXZzmF2Efww0q3s.jpg",
        backdropUrl: "https://media.themoviedb.org/t/p/w1000_and_h450_multi_faces/qwK9soQmmJ7kRdjLZVXblw3g7AQ.jpg",
        releaseDate: "releaseDate",
        mainGenre: 'action',
        voteRating: 4.5,
        isAdult: true,
        casts: [
          Cast(fullName: 'name', avatarUrl: 'https://media.themoviedb.org/t/p/w240_and_h266_face/dYbYNxMnqhNyAJyrPU7e2C9jcRz.jpg', character: 'a')
        ]
      ));
  }
}