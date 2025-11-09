abstract class MovieFavoriteUseCase {
  void addToFavorite(num id);
  void removeFromFavorite(num id);
  Future<bool> getFavoriteStatus(num id);
}