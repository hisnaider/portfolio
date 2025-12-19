import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/analytics.dart';
import 'package:portfolio/src/scroll_section/views/intro/hero_page/hero_page.dart';
import 'package:portfolio/src/scroll_section/views/intro/welcome/welcome.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection> {
  bool _heroPageReached = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    const double threshold = 1000;
    final bool _isDesktop = [
      TargetPlatform.windows,
      TargetPlatform.linux,
      TargetPlatform.macOS
    ].contains(Analytics.instance.getPlatform);
    return SliverPersistentHeader(
      floating: false,
      pinned: false,
      delegate: _CustomSliverPersistentHeaderDelegate(
        screenHeight: screenHeight,
        threshold: threshold,
        child: (context, shrinkOffset, overlapsContent) {
          if (shrinkOffset >= 1600 && _heroPageReached) {
            _heroPageReached = false;
          } else if (shrinkOffset >= 500 &&
              shrinkOffset < 1600 &&
              !_heroPageReached) {
            _heroPageReached = true;
            Analytics.instance
                .getSectionReachedEvent(section: kSectionIdHeropage);
          } else if (shrinkOffset < 500 && _heroPageReached) {
            _heroPageReached = false;
          }
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            height: screenHeight,
            child: AnimatedBuilder(
              animation: widget.scrollController,
              builder: (context, child) {
                final double progress =
                    (widget.scrollController.offset / threshold).clamp(0, 1);
                final double shrinkProgress = shrinkOffset
                    .normalize(screenHeight + threshold - 250, min: threshold);
                return Stack(
                  children: [
                    if (progress <= 0.5)
                      Welcome(
                        isDesktop: _isDesktop,
                        scrollValue: progress,
                        start: 0,
                        end: 0.5,
                      ),
                    if (progress > 0.4 &&
                        shrinkOffset < screenHeight + threshold - 200)
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
