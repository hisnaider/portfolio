import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/src/main_page/views/hero_page/hero_page.dart';
import 'package:portfolio/src/main_page/views/welcome/welcome.dart';

class IntroSection extends StatelessWidget {
  final ScrollController controller;
  const IntroSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    const double threshold = 1000;
    return SliverPersistentHeader(
      floating: false,
      pinned: false,
      delegate: _InitialSectionSliverPersistentHeaderDelegate(
        screenHeight: screenHeight,
        child: (context, shrinkOffset, overlapsContent) {
          return SizedBox(
            height: screenHeight,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                final double progress =
                    (controller.offset / threshold).clamp(0, 1);
                final double shrinkProgress = shrinkOffset
                    .normalize(screenHeight + threshold - 500, min: threshold);
                return Stack(
                  children: [
                    if (progress <= 0.5)
                      Welcome(
                        scrollValue: progress,
                        start: 0,
                        end: 0.5,
                      ),
                    if (progress <= 1 && shrinkProgress < 1)
                      Opacity(
                        opacity: 1 - shrinkProgress,
                        child: HeroPage(
                          scrollValue: progress,
                          start: 0.4,
                          end: 1,
                        ),
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _InitialSectionSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const _InitialSectionSliverPersistentHeaderDelegate({
    required this.child,
    required this.screenHeight,
  });
  final Widget Function(
      BuildContext context, double shrinkOffset, bool overlapsContent) child;

  final double screenHeight;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child(context, shrinkOffset, overlapsContent);

  @override
  double get maxExtent => screenHeight + 1000;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(
          covariant _InitialSectionSliverPersistentHeaderDelegate
              oldDelegate) =>
      false;
}
