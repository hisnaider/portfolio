import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/hero_page/hero_page.dart';
import 'package:portfolio/src/main_page/views/welcome/welcome.dart';

class IntroSection extends StatelessWidget {
  final ScrollController controller;
  final double threshold;
  const IntroSection(
      {super.key, required this.controller, required this.threshold});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final double progress = (controller.offset / threshold).clamp(0, 1);
        return Stack(
          children: [
            if (progress <= 0.5)
              Center(
                child: Welcome(
                  scrollValue: progress,
                  start: 0,
                  end: 0.5,
                ),
              ),
            if (progress <= 1)
              Center(
                child: HeroPage(
                  scrollValue: progress,
                  start: 0.4,
                  end: 1,
                ),
              ),
          ],
        );
      },
    );
  }
}

const double _introHeight = 900;

class SliverIntro extends StatelessWidget {
  const SliverIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: _IntroDelegate(),
    );
  }
}

class _IntroDelegate extends SliverPersistentHeaderDelegate {
  static const double maxHeight = 900;
  static const double minHeight = 0;

  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = (shrinkOffset / maxHeight).clamp(0.0, 1.0);

    return SizedBox(
      height: maxHeight - shrinkOffset,
      child: Stack(
        children: [
          if (progress <= 0.25)
            Welcome(
              scrollValue: progress,
              start: 0,
              end: 0.25,
            ),
          if (progress <= 0.5)
            HeroPage(
              scrollValue: progress,
              start: 0.2,
              end: 0.5,
            ),
        ],
      ),
    );
  }
}
