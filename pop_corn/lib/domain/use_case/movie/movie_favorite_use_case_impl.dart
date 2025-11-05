import 'package:pop_corn/data/storage/favorite_storage.dart';

import 'movie_favorite_use_case.dart';

class MovieFavoriteUseCaseImpl extends MovieFavoriteUseCase {

  final FavoriteStorage storage;

  MovieFavoriteUseCaseImpl({required this.storage});

  @override
  void addToFavorite(num id) {
    storage.addToFavorite(id);
  }

  @override
  List<int> getFavorite() {
    // TODO: implement getFavorite
    throw UnimplementedError();
  }

  @override
  void removeFromFavorite(num id) {
    storage.removeFromFavorite(id);
  }
}