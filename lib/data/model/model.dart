class Post {
  late final int id;
  late final String title;
  late final String body;

  Post({
    required this.id,
    required this.title,
    required this.body
  });

  Post.fromJson(Map<String, dynamic> json){
        id = json["id"];
        title = json["title"];
        body = json["body"];
  }
}