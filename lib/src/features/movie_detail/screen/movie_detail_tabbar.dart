import 'package:flutter/material.dart';

import '../../../common/utils/extension_context.dart';

class MovieDetailTabbar extends StatelessWidget {
  const MovieDetailTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MyTabBar(
        child: ColoredBox(
          color: context.colorScheme.primary,
          child: TabBar(
            isScrollable: false,
            labelStyle: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
            labelPadding: const EdgeInsets.only(top: 10, bottom: 10),
            indicatorColor: context.colorScheme.primaryContainer,
            dividerHeight: 0,
            physics: const NeverScrollableScrollPhysics(),
            tabAlignment: TabAlignment.fill,
            tabs: [
              Text(context.lang.aboutMovie, style: context.textTheme.bodyMedium),
              Text(context.lang.images, style: context.textTheme.bodyMedium),
              Text(context.lang.cast, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTabBar extends SliverPersistentHeaderDelegate {
  MyTabBar({required this.child});

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
