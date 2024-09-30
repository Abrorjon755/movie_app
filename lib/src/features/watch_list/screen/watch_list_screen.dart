import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/models/genre.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/router/app_router.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/movie_item.dart';
import 'no_movie.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => WatchListScreenState();
}

class WatchListScreenState extends State<WatchListScreen> {
  final List<MovieModel> movies = [];
  List<Genre> genres = [];

  void getGenre() async {
    genres = await context.dependencies.movieDetailRepository.getGenre();
    setState(() {});
  }

  Future<void> getMovies() async {
    movies.clear();

    movies.addAll((await context.dependencies.db.getMovies()).reversed);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMovies();
    getGenre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.push(AppRouter.settings),
          icon: Icon(
            Icons.menu,
            color: context.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.watchList,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: movies.isEmpty
                  ? const NoMovie()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) =>
                          MovieItem(
                        movie: movies[index],
                        genres: genres,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
