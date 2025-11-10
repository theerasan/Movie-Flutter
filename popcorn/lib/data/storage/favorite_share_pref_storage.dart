import 'package:popcorn/data/storage/favorite_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteSharePrefStorage extends FavoriteStorage {
  late final String _key = '_favorite';

  // Make Storage as Singleton
  static final FavoriteStorage _instance = FavoriteSharePrefStorage._internal();

  factory FavoriteSharePrefStorage() {
    return _instance as FavoriteSharePrefStorage;
  }

  FavoriteSharePrefStorage._internal();

  @override
  Future<bool> addToFavorite(num id) async {
    var result = await Future.wait([
      SharedPreferences.getInstance(),
      getFavorite(),
    ]);
    var instance = result[0] as SharedPreferences;
    var list = (result[1] as List<String>).toSet();
    list.add(id.toString());
    return instance.setStringList(_key, list.toList());
  }

  @override
  Future<List<String>> getFavorite() async {
    var instance = await SharedPreferences.getInstance();
    var result = instance.getStringList(_key);
    if (result != null) {
      return result;
    } else {
      return [];
    }
  }

  @override
  Future<bool> removeFromFavorite(num id) async {
    var result = await Future.wait([
      SharedPreferences.getInstance(),
      getFavorite(),
    ]);
    var instance = result[0] as SharedPreferences;
    var list = result[1] as List<String>;
    list.remove(id.toString());
    return instance.setStringList(_key, list);
  }
}
