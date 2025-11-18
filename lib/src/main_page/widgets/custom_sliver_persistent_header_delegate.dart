import 'package:flutter/material.dart';

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const CustomSliverPersistentHeaderDelegate(
      {required this.child,
      required this.screenHeight,
      required this.threshold});
  final Widget Function(
      BuildContext context, double shrinkOffset, bool overlapsContent) child;

  final double screenHeight;
  final double threshold;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child(context, shrinkOffset, overlapsContent);

  @override
  double get maxExtent => screenHeight + threshold;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(
          covariant CustomSliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
