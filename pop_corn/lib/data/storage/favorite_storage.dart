abstract class FavoriteStorage {
  Future<bool> addToFavorite(num id);
  Future<List<String>> getFavorite();
  Future<bool> removeFromFavorite(num id);
}
