import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../features/watch_list/screen/watch_list_screen.dart';
import '../constants/constants.dart';
import '../models/genre.dart';
import '../models/movies_model.dart';
import '../router/app_router.dart';
import '../style/app_icons.dart';
import '../utils/extension_context.dart';
import 'my_cached_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
    required this.genres,
  });

  final MovieModel movie;
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () async {
        await context.push(AppRouter.movieItem, extra: movie);
        await context
            .findAncestorStateOfType<WatchListScreenState>()
            ?.getMovies();
      },
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 0.65,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: MyCachedImage(
                      imageUrl: "${Constants.imageUrl}${movie.posterPath}",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.star,
                                  width: 19,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${movie.voteAverage}",
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    color: context.colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.ticket,
                                  width: 19,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.primaryContainer,
                                    BlendMode.srcATop,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    genres.genresToString(movie.genreIds),
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.calendar,
                                  width: 19,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.primaryContainer,
                                    BlendMode.srcATop,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  movie.releaseDate,
                                  style: context.textTheme.labelMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.popularity,
                                  width: 19,
                                  colorFilter: ColorFilter.mode(
                                    context.colorScheme.primaryContainer,
                                    BlendMode.srcATop,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  movie.popularity.toStringAsFixed(3),
                                  style: context.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
