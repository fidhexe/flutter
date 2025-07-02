import 'dart:async';
import 'package:dio/dio.dart';
import 'package:esame_flutter/data/model/model.dart';

class ApiService {
  final dio = Dio();
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  //"https://pokeapi.co/api/v2/pokemon?limit=150"
  Future<List<Post>> fetchPosts() async {
    final response = await dio.get('${baseUrl}posts');
    List<Post> posts = (response.data as List)
        .map((postJson) => Post.fromJson(postJson))
        .toList();
    return posts;
  }
}
