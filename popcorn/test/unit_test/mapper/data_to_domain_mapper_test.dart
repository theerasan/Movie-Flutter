import 'package:flutter_test/flutter_test.dart';
import 'package:popcorn/config/assets_url_config.dart';
import 'package:popcorn/data/model/movie_list/movie_dto.dart';
import 'package:popcorn/data/model/movie_list/movie_list_dto.dart';
import 'package:popcorn/domain/mapper/movie_detail_dto_to_movie_detail_mapper.dart';
import 'package:popcorn/domain/mapper/movie_list_dto_to_movie_page_data_mapper.dart';

import '../test_utils.dart';

void main() {
  final config = AssetsUrlConfig();
  test('movie list dto can can map to movie page entry', () {
    const dto = MovieListDTO(
      page: 1,
      lastPage: 10,
      movies: [
        MovieDTO(
          id: 1,
          adult: false,
          posterPath: '/posterPath.png',
          releaseDate: 'releaseDate',
          title: 'Title',
          voteAverage: 5.0,
        ),
      ],
    );

    final mapper = MovieListDTOToMoviePageDataMapper(config: config);
    final moviePage = mapper.map(dto, []);

    expect(moviePage.page, 1);
    expect(moviePage.maxPage, 10);
    expect(moviePage.hasNextPage(), true);

    final movie = moviePage.movies[0];
    expect(movie.id, 1);
    expect(movie.isAdult, false);
    expect(
      movie.posterUrl,
      'https://media.themoviedb.org/t/p/w220_and_h330_face/posterPath.png',
    );
    expect(movie.releaseDate, 'releaseDate');
    expect(movie.title, 'Title');
    expect(movie.rating, 5.0);
    expect(movie.isFavorite, false);

    final moviePage2 = mapper.map(dto, ['1']);
    expect(moviePage2.movies.first.isFavorite, true);
  });
  test('movie detail dto can can map to movie detail entry', () {
    final dto = TestUtils.movieDetailDTO;

    final mapper = MovieDetailDTOToMovieDetailMapper(config: config);
    final isFavorite = true;
    final map = mapper.map(dto, isFavorite);

    expect(map.id, 1);
    expect(map.title, 'Title');
    expect(map.overview, 'Overview');
    expect(
      map.posterUrl,
      'https://media.themoviedb.org/t/p/w220_and_h330_face/posterPath.png',
    );
    expect(
      map.backdropUrl,
      'https://media.themoviedb.org/t/p/w1000_and_h450_multi_faces/backdropPath.png',
    );
    expect(map.releaseDate, 'releaseDate');
    expect(map.isAdult, false);
    expect(map.isFavorite, true);
    expect(map.mainGenre, 'main');
    final cast = map.casts[0];
    expect(cast.fullName, 'actor name');
    expect(
      cast.avatarUrl,
      'https://media.themoviedb.org/t/p/w240_and_h266_face/profilePath.png',
    );
    expect(cast.character, 'character');
  });
}
