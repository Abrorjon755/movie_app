import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/style/app_icons.dart';
import '../../../common/utils/extension_context.dart';
import 'movie_tab_bar.dart';

class MovieShimmer extends StatelessWidget {
  const MovieShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.primary,
      highlightColor: context.colorScheme.primaryContainer,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: WidgetStateColor.transparent,
            title: InkWell(
              overlayColor: WidgetStateColor.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.colorScheme.primaryContainer,
                ),
                child: SizedBox(
                  height: 42,
                  child: Row(
                    children: [
                      const SizedBox(width: 24),
                      Text(
                        context.lang.search,
                        style: context.textTheme.titleSmall,
                      ),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(AppIcons.search2),
                      const SizedBox(width: 14),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
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
                      for (int i = 0; i < 5; i++)
                        ZoomTapAnimation(
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
                                    child: const SizedBox(
                                      width: 130,
                                      height: 210,
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
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
                                        fontSize: 96,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = context
                                              .colorScheme.onPrimaryContainer,
                                      ),
                                    ),
                                    Text(
                                      "${i + 1}",
                                      style: context.textTheme.displayLarge
                                          ?.copyWith(
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
          ),
          SliverPersistentHeader(
            delegate: MovieTabBar(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBar(
                      physics: const BouncingScrollPhysics(),
                      tabAlignment: TabAlignment.fill,
                      dividerHeight: 0,
                      indicatorColor: context.colorScheme.secondary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 12,
                      ),
                      indicatorWeight: 4,
                      labelStyle: context.textTheme.bodyMedium,
                      tabs: [
                        Text(context.lang.upcoming),
                        Text(context.lang.topRated),
                        Text(context.lang.popular),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      for (int i = 0; i < 15; i++)
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
