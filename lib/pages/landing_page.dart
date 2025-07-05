import 'package:esame_flutter/components/list_tab/post_tab.dart';
import 'package:esame_flutter/data/service/api_service.dart';
import 'package:flutter/material.dart' hide Tab;

import '../data/model/model.dart';
import '../data/service/favorites_manager.dart';

class LandingPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesManager = FavoritesManager();

    return Scaffold(
      appBar: AppBar(title: const Text('All Posts')),
      body: FutureBuilder<List<Post>>(
        future: apiService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text("Something went wrong :("));
          }

          final posts = snapshot.data!;

          return ValueListenableBuilder<List<Post>>(
            valueListenable: favoritesManager.favoritesNotifier,
            builder: (context, favoriteList, _) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return PostTab(
                    post: post,
                    onTap: () {
                      Navigator.pushNamed(context, "/detail", arguments: post);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

