// Author: Dean.Liu
// DateTime: 2022/04/29 16:55

import 'package:flutter/material.dart';

/// 在CustomScrollView子视图中使用，在builder中的widget会吸附在顶部
class StickySliverHeaderBuilder extends SliverPersistentHeaderDelegate {
  StickySliverHeaderBuilder({
    required this.maxHeight,
    required this.minHeight,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final Widget Function(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(context, shrinkOffset, overlapsContent);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant StickySliverHeaderBuilder oldDelegate) =>
      maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      builder != oldDelegate.builder;
}
