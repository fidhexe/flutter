import 'package:esame_flutter/pages/detail_page.dart';
import 'package:esame_flutter/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'data/model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      routes: {
        "/": (context) => LandingPage(),
        "/detail": (context) {
          final Post post = ModalRoute.of(context)!.settings.arguments as Post;
          return DetailPage(post: post);
        },
      },
    );
  }
}
