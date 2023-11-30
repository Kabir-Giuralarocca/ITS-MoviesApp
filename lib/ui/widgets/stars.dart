import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            rating > i ? Icons.star : Icons.star_border,
            size: 12,
            color: rating > i ? Colors.amber : Colors.grey,
          )
      ],
    );
  }
}
