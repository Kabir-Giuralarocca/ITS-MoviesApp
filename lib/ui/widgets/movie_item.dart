import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/common_widget.dart';
import 'package:movies_app/ui/widgets/movie_poster.dart';
import 'package:movies_app/ui/widgets/stars.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16, top: 16),
            padding: const EdgeInsets.fromLTRB(120, 16, 16, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: lightShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: bold_14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Stars(rating: movie.rating),
                height_4,
                Text(
                  "${movie.director} • 23/7/2008",
                  style: medium_10.copyWith(color: Colors.grey.shade700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                filler,
                Text(
                  movie.description,
                  style: regular_10.copyWith(color: Colors.grey.shade700),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          MoviePoster(
            image: movie.image,
          ),
        ],
      ),
    );
  }
}
