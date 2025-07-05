import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/model.dart';


class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  final ValueNotifier<List<Post>> favoritesNotifier = ValueNotifier([]);

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('favorites') ?? [];

    final loaded = data.map((e) => Post.fromJson(json.decode(e))).toList();
    favoritesNotifier.value = loaded;
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = favoritesNotifier.value.map((p) => json.encode(p.toJson())).toList();
    await prefs.setStringList('favorites', data);
  }

  bool isFavorite(Post post) {
    return favoritesNotifier.value.any((p) => p.id == post.id);
  }

  Future<void> toggleFavorite(Post post) async {
    final current = favoritesNotifier.value;
    if (isFavorite(post)) {
      favoritesNotifier.value = current.where((p) => p.id != post.id).toList();
    } else {
      favoritesNotifier.value = [...current, post];
    }
    await saveFavorites();
  }
}
