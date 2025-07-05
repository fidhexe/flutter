import 'package:flutter/material.dart';
import '../../data/model/model.dart';
import '../../data/service/favorites_manager.dart';
import '../buttons/save_button.dart';

class PostTab extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;

  const PostTab({super.key, required this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isFavorite = FavoritesManager().isFavorite(post);

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              // TEXT CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SaveButton(
                isFavorite: isFavorite,
                onToggle: () async {
                  await FavoritesManager().toggleFavorite(post);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

