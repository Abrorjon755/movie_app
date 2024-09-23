import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/router/app_router.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/my_cached_image.dart';

class HeaderMovies extends StatelessWidget {
  const HeaderMovies({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 12),
                for (int i = 0; i < movies.length; i++)
                  ZoomTapAnimation(
                    onTap: () =>
                        context.push(AppRouter.movieItem, extra: movies[i]),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                              ),
                              child: SizedBox(
                                width: 130,
                                height: 210,
                                child: MyCachedImage(
                                  imageUrl:
                                      "${Constants.imageUrl}${movies[i].posterPath}",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Stack(
                            children: [
                              Text(
                                "${i + 1}",
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 96,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color =
                                        context.colorScheme.onPrimaryContainer,
                                ),
                              ),
                              Text(
                                "${i + 1}",
                                style: context.textTheme.displayLarge?.copyWith(
                                  fontSize: 96,
                                  color: context.colorScheme.primary,
                                ),
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
        ],
      ),
    );
  }
}
