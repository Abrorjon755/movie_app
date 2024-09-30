import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movies_model.dart';
import '../../../common/router/app_router.dart';
import '../../../common/style/app_lotties.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/my_cached_image.dart';

class MovieImages extends StatefulWidget {
  const MovieImages({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<MovieImages> createState() => _MovieImagesState();
}

class _MovieImagesState extends State<MovieImages> {
  List<String> images = [];

  Future<void> getImages() async {
    images = [];
    images = await context.dependencies.movieDetailRepository
        .getImages(widget.movie.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: context.colorScheme.primary,
      color: context.colorScheme.onPrimary,
      onRefresh: () async {
        await getImages();
        setState(() {});
      },
      child: images.isNotEmpty
          ? GridView.builder(
              itemCount: images.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (BuildContext context, int index) => Hero(
                tag: "${Constants.imageUrl}${images[index]}",
                child: ZoomTapAnimation(
                  onTap: () {
                    context.push(AppRouter.fullScreenImage,
                        extra: "${Constants.imageUrl}${images[index]}");
                  },
                  child: MyCachedImage(
                      imageUrl: "${Constants.imageUrl}${images[index]}"),
                ),
              ),
            )
          : Center(
              child: Lottie.asset(AppLotties.loading, width: 100),
            ),
    );
  }
}
