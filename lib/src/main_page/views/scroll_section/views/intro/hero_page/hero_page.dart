import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/intro/hero_page/widget/introduction.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/intro/hero_page/widget/mini_star_system.dart';

class HeroPage extends StatelessWidget {
  const HeroPage(
      {super.key,
      required this.scrollValue,
      required this.start,
      required this.end});
  final double scrollValue;
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    final value = scrollValue.normalize(end, min: start);
    final fade = value.normalize(0.3, min: 0);
    final slideIntroduction = value.normalize(0, min: 0.15);
    final slideMiniStarSystem = value.normalize(0, min: 0.15);
    final fadeSlideSubtitle =
        Curves.easeOut.transform(value.normalize(0.6, min: 0.2));
    final skillScale =
        Curves.easeInOut.transform(value.normalize(0.6, min: 0.3));
    final curriculumFade = value.normalize(0.6, min: 0.3);
    return LayoutBuilder(builder: (context, constraints) {
      final double aspectRadio =
          MediaQuery.of(context).size.height / constraints.maxWidth;
      if (aspectRadio < 0.75) {
        final double minSize = 600 * (aspectRadio * 0.75);
        final double minScale = 1 * (aspectRadio);
        final double scale = constraints.maxWidth.normalize(1200, min: 800);
        return Opacity(
          opacity: fade,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1400, maxHeight: 875),
              padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 40),
              child: OverflowBox(
                alignment: Alignment.center,
                maxHeight: MediaQuery.of(context).size.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Transform.translate(
                      offset: Offset(-250 * slideIntroduction, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 625,
                          child: Introduction(
                            curriculumFade: curriculumFade,
                            subtitleOpacity: fadeSlideSubtitle,
                            subtitleOffset:
                                Offset(0, 50 - 50 * fadeSlideSubtitle),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(width: 24),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..scale(scale.getInterval(1, minScale))
                        ..translate(250 * slideMiniStarSystem, 0),
                      child: SizedBox(
                        width: scale.getInterval(600, minSize),
                        child: Center(
                          child: RepaintBoundary(
                            child: MiniStarSystem(
                              skillScale: skillScale,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      final double scale = constraints.maxWidth.normalize(700, min: 0);
      final size = scale.getInterval(500, 100);
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 750),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: OverflowBox(
            alignment: Alignment.center,
            maxHeight: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Transform.scale(
                  scale: scale.getInterval(1, 0.5),
                  child: Opacity(
                    opacity: fade,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: size, maxHeight: size),
                      child: RepaintBoundary(
                        child: MiniStarSystem(
                          skillScale: skillScale,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Opacity(
                  opacity: fade,
                  child: Transform.translate(
                    offset: Offset(0, 250 * slideIntroduction),
                    child: Introduction(
                      curriculumFade: curriculumFade,
                      subtitleOpacity: fadeSlideSubtitle,
                      subtitleOffset: Offset(0, 50 - 50 * fadeSlideSubtitle),
                      textAlign: TextAlign.center,
                      isMobile: constraints.maxWidth < 650,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
