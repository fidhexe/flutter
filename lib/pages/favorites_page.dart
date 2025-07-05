import 'package:esame_flutter/components/list_tab/post_tab.dart';
import 'package:flutter/material.dart';
import '../data/model/model.dart';
import '../data/service/favorites_manager.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = FavoritesManager();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: ValueListenableBuilder<List<Post>>(
        valueListenable: manager.favoritesNotifier,
        builder: (context, favorites, _) {
          if (favorites.isEmpty) {
            return const Center(child: Text("No favorites yet"));
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return PostTab(post: favorites[index]);
            },
          );
        },
      ),
    );
  }
}

