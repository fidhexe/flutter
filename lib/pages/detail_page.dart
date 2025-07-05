import 'package:esame_flutter/components/buttons/save_button.dart';
import 'package:flutter/material.dart';
import '../data/model/model.dart';

class DetailPage extends StatefulWidget {
  final Post post;

  const DetailPage({super.key, required this.post});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("DETAILS"),
            SaveButton(isFavorite: isFavorite, onToggle: toggleFavorite),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(widget.post.body),
            Spacer(),
            Center(),
          ],
        ),
      ),
    );
  }
}
