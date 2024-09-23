import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/utils/extension_context.dart';
import 'header_movies.dart';
import 'movie_shimmer.dart';
import 'movie_tab_bar.dart';
import 'category_of_movies.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key, required this.onPressed});

  final void Function(int v) onPressed;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<MovieModel> movies = [];
  List<MovieModel> popularMovies = [];
  int page = 1;
  int popularPage = 1;
  bool isLoading = false;

  Future<void> getMovies(int page) async {
    isLoading = true;
    setState(() {});
    movies = [];
    final List<MovieModel> result =
        await context.dependencies.movieRepository.getNowPlaying();
    movies.addAll(result);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMovies(page);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.whatToWatch,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: isLoading
            ? const MovieShimmer()
            : NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: WidgetStateColor.transparent,
                    title: InkWell(
                      onTap: () => widget.onPressed(1),
                      overlayColor: WidgetStateColor.transparent,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SizedBox(
                          height: 42,
                          child: Row(
                            children: [
                              const SizedBox(width: 24),
                              Text(
                                context.lang.search,
                                style: context.textTheme.titleSmall?.copyWith(
                                  color: context.colorScheme.primaryContainer,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              SvgPicture.asset(
                                AppIcons.search2,
                                colorFilter: ColorFilter.mode(
                                  context.colorScheme.primaryContainer,
                                  BlendMode.srcATop,
                                ),
                              ),
                              const SizedBox(width: 14),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  HeaderMovies(movies: movies),
                  const MovieTab(),
                ],
                body: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TabBarView(
                    children: [
                      UpcomingMovies(
                        categoryOfMovies: Constants.pathUpcoming,
                      ),
                      UpcomingMovies(
                        categoryOfMovies: Constants.pathTopRated,
                      ),
                      UpcomingMovies(
                        categoryOfMovies: Constants.pathPopular,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
