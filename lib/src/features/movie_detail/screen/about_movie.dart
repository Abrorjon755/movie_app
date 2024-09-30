import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../common/constants/constants.dart';
import '../../../common/models/movie.dart';
import '../../../common/style/app_lotties.dart';
import '../../../common/utils/extension_context.dart';
import '../../../common/widgets/my_cached_image.dart';

class AboutMovie extends StatefulWidget {
  const AboutMovie({super.key, required this.id});

  final int id;

  @override
  State<AboutMovie> createState() => _AboutMovieState();
}

class _AboutMovieState extends State<AboutMovie> {
  Movie? movie;

  Future<void> getMovie() async {
    List<Movie> check =
        await (context.dependencies.movieDetailRepository.getMovie(widget.id));
    if (check.isNotEmpty) {
      movie = check.first;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: context.colorScheme.primary,
      color: context.colorScheme.onPrimary,
      onRefresh: () async {
        await getMovie();
        setState(() {});
      },
      child: movie != null
          ? ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                MyMovieText(
                  title: context.lang.name,
                  text: movie?.title,
                ),
                MyMovieText(
                  title: context.lang.budget,
                  text: "\$ ${NumberFormat("#,###").format(movie?.budget)}",
                ),
                MyMovieText(
                  title: context.lang.age,
                  text: movie?.adult ?? false ? "18+" : "16+",
                ),
                MyMovieText(
                  title: context.lang.originalLanguage,
                  text: movie?.originalLanguage.toString().toUpperCase(),
                ),
                MyMovieText(
                  title: context.lang.popularity,
                  text: movie?.popularity.toStringAsFixed(2),
                ),
                MyMovieText(
                  title: context.lang.status,
                  text: movie?.status,
                ),
                const SizedBox(height: 10),
                Text(
                  "${context.lang.productionCompanies} :",
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (ProductionCompany i
                        in movie?.productionCompanies ?? [])
                      DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: context.colorScheme.secondary,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 3 - 18,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.secondary,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MyCachedImage(
                                        imageUrl:
                                            "${Constants.imageUrl}${i.logoPath}",
                                        fit: null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 35,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Text(
                                      i.name,
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "${context.lang.overview} :",
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  "${movie?.overview}",
                  style: context.textTheme.bodyMedium,
                ),
              ],
            )
          : Center(
              child: Lottie.asset(AppLotties.loading, width: 100),
            ),
    );
  }
}

class MyMovieText extends StatelessWidget {
  const MyMovieText({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: context.textTheme.bodyMedium?.copyWith(
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: context.colorScheme.secondary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text ?? context.lang.infoNotFound,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
