import 'package:flutter/material.dart';
import '../../../common/models/genre.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/utils/extension_context.dart';
import 'app_bar_detail.dart';
import 'movie_detail_app_bar.dart';
import 'movie_detail_tabbar.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  List<Genre> genres = [];

  void getGenre() async {
    genres = await context.dependencies.movieDetailRepository.getGenre();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getGenre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MovieDetailAppBar(movie: widget.movie),
            AppBarDetail(
              genres: genres,
              movie: widget.movie,
            ),
            const MovieDetailTabbar(),
          ],
          body: const SizedBox(),
        ),
      ),
    );
  }
}
