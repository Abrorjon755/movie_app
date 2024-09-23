import 'package:flutter/material.dart';

import '../../../common/utils/extension_context.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MovieTabBar(
        child: ColoredBox(
          color: context.colorScheme.primary,
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
    );
  }
}

class MovieTabBar extends SliverPersistentHeaderDelegate {
  const MovieTabBar({required this.child});

  final Widget child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      child;

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
