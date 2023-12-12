import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/ui/widgets/collapsing_app_bar.dart';
import 'package:movies_app/ui/widgets/list_description.dart';
import 'package:movies_app/ui/widgets/movie_item.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    super.key,
    this.showtopRated = false,
  });

  final bool showtopRated;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<List<Movie>> moviesList;

  @override
  void initState() {
    super.initState();

    moviesList = MovieRepository.movies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            moviesList = MovieRepository.movies();
          });
        }),
        child: FutureBuilder(
          future: moviesList,
          builder: (context, snapshot) {
            snapshot.data?.sort((a, b) => b.id.compareTo(a.id));
            var topRated =
                snapshot.data?.where((movie) => movie.rating == 5).toList() ??
                    [];
            return CustomScrollView(
              slivers: [
                CollapsingAppBar(
                  title: widget.showtopRated ? "Top Rated Movies" : "Movies",
                ),
                if (snapshot.hasError)
                  const Center(
                    child: Text("Error"),
                  ),
                if (snapshot.hasData)
                  const ListDescription(
                    description:
                        "Qui puoi vedere la raccolta di tutti i tuoi film che hai inserito nell'applicazione.",
                  ),
                SliverList.builder(
                  itemCount: widget.showtopRated
                      ? topRated.length
                      : snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: MovieItem(
                        movie: widget.showtopRated
                            ? topRated[index]
                            : snapshot.data![index],
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
