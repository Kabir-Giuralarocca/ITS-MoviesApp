import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/auth_repository.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/domain/models/movie_model.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/common_widget.dart';
import 'package:movies_app/ui/widgets/loading_screen.dart';
import 'package:movies_app/ui/widgets/movie_carausel_item.dart';
import 'package:movies_app/ui/widgets/movie_item.dart';
import 'package:movies_app/ui/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> movies;
  List<Movie> topRated = [];

  @override
  void initState() {
    super.initState();
    movies = MovieRepository.movies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          topRated = snapshot.data!.where((e) => e.rating == 5).toList();
        }
        return Scaffold(
          appBar: _homeAppBar(context),
          body: snapshot.hasError
              ? const Center(
                  child: Text("Error"),
                )
              : LoadingScreen(
                  showLoader: !snapshot.hasData,
                  screen: RefreshIndicator(
                    onRefresh: () =>
                        Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        movies = MovieRepository.movies();
                      });
                    }),
                    color: Colors.black,
                    child: ListView(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.all(16),
                      children: [
                        Text(
                          "Inserisci le tue credenziali per creare il tuo account e poter accedere all’applicazione.",
                          style: medium_14,
                        ),
                        height_16,
                        const SectionTitle(
                          label: "Top Rated",
                          showTopRated: true,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 360,
                          child: ListView(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < 3; i++)
                                snapshot.hasData
                                    ? MovieCarauselItem(
                                        movie: topRated[i],
                                      )
                                    : Container(),
                            ],
                          ),
                        ),
                        const SectionTitle(label: "Movies"),
                        for (var i = 0; i < 3; i++)
                          snapshot.hasData
                              ? MovieItem(
                                  movie: snapshot.data![i],
                                )
                              : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: const Text("Aggiungi"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  AppBar _homeAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: const Text("Movies App"),
      titleTextStyle: bold_24.copyWith(color: Colors.white),
      actions: [
        GestureDetector(
          onTap: () => AuthRepository.logout(context),
          child: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
