import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/common_widget.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.image,
    this.height = 180,
    this.width = 120,
  });

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: imageShadow,
      ),
      child: Image.network(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.blueGrey.shade900,
            width: width,
            height: height,
            child: const Icon(
              Icons.movie,
              color: Colors.white,
              size: 48,
            ),
          );
        },
      ),
    );
  }
}
