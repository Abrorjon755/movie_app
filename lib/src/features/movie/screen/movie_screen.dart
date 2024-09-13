import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/src/common/style/app_icons.dart';

import '../../../common/l10n/generated/l10n.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: DefaultTabController(
        length: 4,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          children: [
            InkWell(
              onTap: () {},
              overlayColor: WidgetStateColor.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  height: 42,
                  child: Row(
                    children: [
                      const SizedBox(width: 24),
                      Text(
                        S.of(context).search,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                      ),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        AppIcons.search2,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primaryContainer,
                          BlendMode.srcATop,
                        ),
                      ),
                      const SizedBox(width: 14),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < 5; i++)
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const SizedBox(
                              width: 115,
                              height: 210,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            "${i + 1}",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                              fontSize: 96,
                              color: Theme.of(context).colorScheme.primary,
                              shadows: [
                                Shadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  blurRadius: 7,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            const SizedBox(height: 30),
            TabBar(
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 12,
              ),
              indicatorWeight: 4,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              tabs: [
                Text(S.of(context).nowPlaying),
                Text(S.of(context).upcoming),
                Text(S.of(context).topRated),
                Text(S.of(context).popular),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 600,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: GridView(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 18,
                          mainAxisExtent: 145,
                        ),
                        children: [
                          for (int i = 0; i < 15; i++)
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(16),
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
    );
  }
}
