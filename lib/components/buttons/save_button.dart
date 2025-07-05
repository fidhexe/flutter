import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggle;

  const SaveButton({Key? key,
    required this.isFavorite,
    required this.onToggle
  }) : super (key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.star : Icons.star,
        color: isFavorite ? Colors.yellow : Colors.grey,
      ),
      onPressed: onToggle,
      tooltip: isFavorite ? 'Unsave' : 'Save',
    );
  }
}
