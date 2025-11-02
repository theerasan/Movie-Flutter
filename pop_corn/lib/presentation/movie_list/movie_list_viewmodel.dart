import 'package:flutter/cupertino.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';

class MovieListViewModel extends ChangeNotifier {
  final List<Movie> movies = [
    Movie(
      id: 507244,
      title: 'Afterburn',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/kHOfxq7cMTXyLbj0UmdoGhT540O.jpg',
      isFavorite: false,
      rating: 6.747,
      releaseDate: '2025-08-20',
      isAdult: false
    ),
    Movie(
      id: 1280450,
      title: 'Stolen Girl',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/fZlNXEHZsBp7unqw009MeBbMv87.jpg',
      isFavorite: false,
      rating: 6.44,
      releaseDate: '2025-09-04',
      isAdult: false
    ),
    Movie(
      id: 1290159,
      title: 'A House of Dynamite: Wrath of Sinners',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/AiJ8L90ftPAwVf3SDx7Fj9IMZoy.jpg',
      isFavorite: true,
      rating: 7.5,
      releaseDate: '2025-10-02',
      isAdult: false
    ),
    Movie(
      id: 507244,
      title: 'Afterburn',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/kHOfxq7cMTXyLbj0UmdoGhT540O.jpg',
      isFavorite: false,
      rating: 6.747,
      releaseDate: '2025-08-20',
      isAdult: false,
    ),
    Movie(
      id: 1280450,
      title: 'Stolen Girl',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/fZlNXEHZsBp7unqw009MeBbMv87.jpg',
      isFavorite: false,
      rating: 6.44,
      releaseDate: '2025-09-04',
      isAdult: true,
    ),
    Movie(
      id: 1290159,
      title: 'A House of Dynamite',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/AiJ8L90ftPAwVf3SDx7Fj9IMZoy.jpg',
      isFavorite: true,
      rating: 7.5,
      releaseDate: '2025-10-02',
      isAdult: false,
    ),
    Movie(
      id: 507244,
      title: 'Afterburn',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/kHOfxq7cMTXyLbj0UmdoGhT540O.jpg',
      isFavorite: false,
      rating: 6.747,
      releaseDate: '2025-08-20',
      isAdult: false,
    ),
    Movie(
      id: 1280450,
      title: 'Stolen Girl',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/fZlNXEHZsBp7unqw009MeBbMv87.jpg',
      isFavorite: false,
      rating: 6.44,
      releaseDate: '2025-09-04',
      isAdult: false,
    ),
    Movie(
      id: 1290159,
      title: 'A House of Dynamite',
      posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/AiJ8L90ftPAwVf3SDx7Fj9IMZoy.jpg',
      isFavorite: true,
      rating: 7.5,
      releaseDate: '2025-10-02',
      isAdult: false,
    )
  ];

  void loadMore() {
    print("load more");
    movies.addAll([
      Movie(
        id: 507243,
        title: 'Afterburn',
        posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/kHOfxq7cMTXyLbj0UmdoGhT540O.jpg',
        isFavorite: false,
        rating: 6.747,
        releaseDate: '2025-08-20',
        isAdult: false,
      ),
      Movie(
        id: 1280450,
        title: 'Stolen Girl',
        posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/fZlNXEHZsBp7unqw009MeBbMv87.jpg',
        isFavorite: false,
        rating: 6.44,
        releaseDate: '2025-09-04',
        isAdult: false,
      ),
      Movie(
        id: 1290159,
        title: 'A House of Dynamite',
        posterUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face/AiJ8L90ftPAwVf3SDx7Fj9IMZoy.jpg',
        isFavorite: true,
        rating: 7.5,
        releaseDate: '2025-10-02',
        isAdult: false,
      )
    ]);
    notifyListeners();
  }
}