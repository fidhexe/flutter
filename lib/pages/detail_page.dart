import 'package:flutter/material.dart';
import '../data/model/model.dart';

class DetailPage extends StatelessWidget {
  final Post post;

  const DetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set backbutton in the appBar: as external component
      appBar: AppBar(title: Text("DETAILS")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title),
            SizedBox(height: 20),
            Text(post.body),
            Spacer(),
            Center()],
        ),
      ),
    );
  }
}
