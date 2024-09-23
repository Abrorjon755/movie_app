import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/genre.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/style/app_icons.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/my_cached_image.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    super.key,
    required this.genres,
    required this.movie,
  });

  final List<Genre> genres;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: SizedBox(
                  height: 210,
                  child: MyCachedImage(
                    imageUrl: "${Constants.imageUrl}${movie.backdropPath}",
                  ),
                ),
              ),
              Positioned(
                top: 170,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.32),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppIcons.star,
                              width: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            width: 95,
                            child: MyCachedImage(
                              imageUrl:
                                  "${Constants.imageUrl}${movie.posterPath}",
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              Text(
                                movie.title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.calendar,
                colorFilter: ColorFilter.mode(
                  context.colorScheme.primaryContainer,
                  BlendMode.srcATop,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                movie.releaseDate,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primaryContainer,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 1,
                height: 16,
                color: context.colorScheme.primaryContainer,
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(
                AppIcons.ticket,
                colorFilter: ColorFilter.mode(
                  context.colorScheme.primaryContainer,
                  BlendMode.srcATop,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                genres.genresToString(movie.genreIds),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
