import 'package:flutter/material.dart';

import '../../../common/utils/extension_context.dart';

class MovieDetailTabbar extends StatelessWidget {
  const MovieDetailTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        TabBar(
          isScrollable: false,
          labelStyle: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
          labelPadding: const EdgeInsets.only(bottom: 15, top: 15),
          indicatorColor: context.colorScheme.primaryContainer,
          physics: const NeverScrollableScrollPhysics(),
          tabAlignment: TabAlignment.fill,
          tabs: [
            Text(context.lang.aboutMovie),
            Text(context.lang.reviews),
            Text(context.lang.cast),
          ],
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      ColoredBox(
        color: context.colorScheme.primary,
        child: _tabBar,
      );

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
