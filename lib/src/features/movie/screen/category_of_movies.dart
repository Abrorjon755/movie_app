import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/router/app_router.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/my_cached_image.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({
    super.key,
    required this.categoryOfMovies,
  });

  final String categoryOfMovies;

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  List<MovieModel> movies = [];
  int page = 1;

  Future<void> getPopularMovies() async {
    movies = await context.dependencies.movieRepository
        .getMovies(categoryName: widget.categoryOfMovies, page: page++);
    setState(() {});
  }

  String getImage(String path) {
    return "${Constants.imageUrl}$path?${Constants.apiKeyString}";
  }

  void pagination() async {
    movies.addAll(
      await context.dependencies.movieRepository
          .getMovies(categoryName: widget.categoryOfMovies, page: page++),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length + 1,
      physics: const RangeMaintainingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) => index >= movies.length
          ? Center(
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                onPressed: pagination,
                child: Text(
                  context.lang.loadMore,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            )
          : ZoomTapAnimation(
              onTap: () =>
                  context.push(AppRouter.movieItem, extra: movies[index]),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: MyCachedImage(
                    imageUrl:
                        "${Constants.imageUrl}${movies[index].posterPath}",
                  ),
                ),
              ),
            ),
    );
  }
}
