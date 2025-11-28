import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/src/main_page/controller/main_page_controller.dart';
import 'package:portfolio/src/main_page/views/intro/hero_page/hero_page.dart';
import 'package:portfolio/src/main_page/views/intro/welcome/welcome.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    const double threshold = 1000;
    final ScrollController controller =
        MainPageController.of(context).scrollController;

    return SliverPersistentHeader(
      floating: false,
      pinned: false,
      delegate: _CustomSliverPersistentHeaderDelegate(
        screenHeight: screenHeight,
        threshold: threshold,
        child: (context, shrinkOffset, overlapsContent) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            height: screenHeight,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                final double progress =
                    (controller.offset / threshold).clamp(0, 1);
                final double shrinkProgress = shrinkOffset
                    .normalize(screenHeight + threshold - 250, min: threshold);
                return Stack(
                  children: [
                    if (progress <= 0.5)
                      Welcome(
                        scrollValue: progress,
                        start: 0,
                        end: 0.5,
                      ),
                    if (progress >= 0.4 &&
                        shrinkOffset < screenHeight + threshold)
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

class _CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const _CustomSliverPersistentHeaderDelegate(
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
          covariant _CustomSliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
