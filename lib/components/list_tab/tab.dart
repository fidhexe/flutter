import 'package:esame_flutter/components/buttons/save_button.dart';
import 'package:flutter/material.dart';
import '../../data/model/model.dart';

class Tab extends StatefulWidget {
  final Post post;
  final VoidCallback? onTap;

  const Tab({Key? key, required this.post, this.onTap}) : super(key: key);

  @override
  State<Tab> createState() => _TabState();
}

class _TabState extends State<Tab> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.title,
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                     SizedBox(height: 4),
                    Text(
                      widget.post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SaveButton(
                isFavorite: isFavorite,
                onToggle: toggleFavorite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
