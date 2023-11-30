import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/common_widget.dart';
import 'package:movies_app/ui/widgets/movie_poster.dart';

class MovieCarauselItem extends StatelessWidget {
  const MovieCarauselItem({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 16),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 232,
            margin: const EdgeInsets.only(top: 268),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blueGrey.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: lightShadow,
            ),
            child: Text(
              movie.title,
              style: semibold_16.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          MoviePoster(
            image: movie.image,
            width: 200,
            height: 300,
          ),
        ],
      ),
    );
  }
}
