import 'package:flutter/material.dart';

import '../../../common/models/genre.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/movie_item.dart';
import 'not_find.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required this.controller,
    required this.movies,
    required this.isTyped,
    required this.genres,
  });

  final ScrollController controller;
  final List<MovieModel> movies;
  final bool isTyped;
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    if (!isTyped && movies.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Text(
            context.lang.findMovie,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else if (isTyped && movies.isEmpty) {
      return const NotFind();
    } else {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24),
        controller: controller,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) => MovieItem(
          movie: movies[index],
          genres: genres,
        ),
      );
    }
  }
}
