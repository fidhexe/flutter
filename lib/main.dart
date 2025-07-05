import 'package:esame_flutter/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'container_page.dart';
import 'data/model/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Posts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContainerPage(), // <-- entry point
      routes: {
        "/detail": (context) {
          final Post post = ModalRoute.of(context)!.settings.arguments as Post;
          return DetailPage(post: post);
        },
      },
    );
  }
}


/*
"/detail": (context) {
final Post post = ModalRoute.of(context)!.settings.arguments as Post;
return DetailPage(post: post);
},
 */
