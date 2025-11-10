import 'package:popcorn/data/model/movie_detail/cast_dto.dart';
import 'package:popcorn/data/model/movie_detail/credits_dto.dart';
import 'package:popcorn/data/model/movie_detail/genre_dto.dart';
import 'package:popcorn/data/model/movie_detail/movie_detail_dto.dart';

abstract class TestUtils {
  static final movieDetailDTO = MovieDetailDTO(
    id: 1,
    title: 'Title',
    description: 'Overview',
    posterPath: '/posterPath.png',
    backdropPath: '/backdropPath.png',
    releaseDate: 'releaseDate',
    adult: false,
    voteAverage: 5.0,
    genres: [
      GenreDTO(id: 1, name: 'main'),
      GenreDTO(id: 1, name: 'sub'),
    ],
    credits: CreditsDTO(
      casts: [
        CastDTO(
          id: 1,
          name: 'actor name',
          profilePath: '/profilePath.png',
          character: 'character',
        ),
      ],
    ),
  );
}
