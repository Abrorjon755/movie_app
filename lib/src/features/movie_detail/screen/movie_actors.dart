import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/actor.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/router/app_router.dart';
import '../../../common/style/app_lotties.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/my_cached_image.dart';

class MovieActors extends StatefulWidget {
  const MovieActors({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<MovieActors> createState() => _MovieActorsState();
}

class _MovieActorsState extends State<MovieActors> {
  List<Actor> actors = [];

  Future<void> getActors() async {
    actors = await context.dependencies.movieDetailRepository
        .getActors(widget.movie.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getActors();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: context.colorScheme.primary,
      color: context.colorScheme.onPrimary,
      onRefresh: () async {
        await getActors();
        setState(() {});
      },
      child: actors.isEmpty
          ? Center(
              child: Lottie.asset(AppLotties.loading, width: 100),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: actors.length,
                itemBuilder: (context, index) => ZoomTapAnimation(
                  onTap: () => context.push(
                    AppRouter.fullScreenImage,
                    extra:
                        "${Constants.imageUrl}${actors[index].profilePath}?${Constants.apiKeyString}",
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Hero(
                            tag:
                                "${Constants.imageUrl}${actors[index].profilePath}?${Constants.apiKeyString}",
                            child: MyCachedImage(
                              imageUrl:
                                  "${Constants.imageUrl}${actors[index].profilePath}?${Constants.apiKeyString}",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        actors[index].name,
                        style: context.textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        actors[index].character,
                        style: context.textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
              ),
            ),
    );
  }
}
