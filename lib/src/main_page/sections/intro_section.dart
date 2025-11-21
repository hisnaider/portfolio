import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/src/main_page/controller/main_page_controller.dart';
import 'package:portfolio/src/main_page/views/hero_page/hero_page.dart';
import 'package:portfolio/src/main_page/views/welcome/welcome.dart';
import 'package:portfolio/src/main_page/widgets/custom_sliver_persistent_header_delegate.dart';

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
      delegate: CustomSliverPersistentHeaderDelegate(
        screenHeight: screenHeight,
        threshold: threshold,
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
