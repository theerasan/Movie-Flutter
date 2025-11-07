import 'package:pop_corn/domain/model/movie_page_data.dart';
import 'package:pop_corn/domain/use_case/movie/search_movie_list_use_case.dart';
import 'package:pop_corn/util/result.dart';

import '../../../data/model/movie_list/movie_list_dto.dart';
import '../../../data/repository/movie_repository.dart';
import '../../../data/storage/favorite_storage.dart';
import '../../mapper/movie_dto_to_movie_page_data_mapper.dart';
import '../../model/movie.dart';

class SearchMovieListUseCaseImpl extends SearchMovieListUseCase {

  final MovieRepository repo;
  final FavoriteStorage favoriteStorage;
  final MovieDTOToMoviePageDataMapper mapper;

  final List<Movie> _movies = [];
  var _page = 1;
  var _maxPage = 1;
  var _query = '';

  SearchMovieListUseCaseImpl({required this.repo, required this.mapper, required this.favoriteStorage});

  @override
  Future<Result<MoviePageData>> getMovies(String query) async {
    if (_query != query) {
      _page = 1;
      _movies.clear();
    }
    _query = query;

    var data = await Future.wait([
      repo.searchMovies(query, _page),
      favoriteStorage.getFavorite()
    ]);

    var result = data[0] as Result<MovieListDTO>;
    var favorites = data[1] as List<String>;

    switch(result) {
      case Success<MovieListDTO>():
        var data = mapper.map(result.data, favorites);
        _movies.addAll(data.movies);
        _page = data.page;
        _maxPage = data.maxPage;
        return Result.success(MoviePageData(
            page: _page,
            maxPage: _maxPage,
            movies: _movies
        ));
      case Error<MovieListDTO>():
        print('error in use case');
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<MoviePageData>> loadMoreMovies() {
    if (_page < _maxPage) {
      _page++;
      return getMovies(_query);
    }

    throw Exception('No more movie');
  }


}