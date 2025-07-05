import 'package:esame_flutter/components/list_tab/tab.dart';
import 'package:esame_flutter/data/service/api_service.dart';
import 'package:flutter/material.dart' hide Tab;

import '../data/model/model.dart';

class LandingPage extends StatelessWidget {
  final ApiService apiservice = ApiService();

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text('LIST')),
      body: FutureBuilder<List<Post>>(
        future: apiservice.fetchPosts(),
        builder: (context, snapshot) {
          final posts = snapshot.data;
          if (posts == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || posts.isEmpty) {
            return const Center(
              child: Text("Something has gone wrong here :("),
            );
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Tab(
                post: post,
                onTap: () {
                  Navigator.pushNamed(context, "/detail", arguments: post);
                },
              );
            },
          );
        },
      ),
    );
  }
}
