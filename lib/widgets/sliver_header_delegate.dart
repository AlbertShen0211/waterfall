import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  SliverHeaderDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height + 1;
  @override
  double get maxExtent => tabBar.preferredSize.height + 1;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color(0xFFF5F6F8),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F8),
          border: Border(bottom: BorderSide(color: Colors.transparent)),
        ),
        child: tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return false;
  }
}
