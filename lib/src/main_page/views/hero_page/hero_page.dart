import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/src/main_page/views/hero_page/widget/introduction.dart';
import 'package:portfolio/src/main_page/views/hero_page/widget/mini_star_system.dart';

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
    final slideRight = value.normalize(0, min: 0.15);
    final slideleft = value.normalize(0, min: 0.15);
    final fadeSlideSubtitle =
        Curves.easeOut.transform(value.normalize(0.6, min: 0.2));
    final skillScale =
        Curves.easeInOut.transform(value.normalize(0.6, min: 0.3));
    final curriculumFade = value.normalize(0.6, min: 0.3);
    final skillScaleDown =
        Curves.easeInOut.transform(value.normalize(1, min: 0.8));
    final slideUp = value.normalize(1, min: 0.8);
    final fadeOut = value.normalize(1, min: 0.8);
    return Transform.translate(
      offset: Offset(0, -200 * slideUp),
      child: Opacity(
        opacity: fade - fadeOut,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1400, maxHeight: 875),
            padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Transform.translate(
                  offset: Offset(-250 * slideleft, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 625,
                      child: Introduction(
                        fadeSlideSubtitle: fadeSlideSubtitle,
                        curriculumFade: curriculumFade,
                      ),
                    ),
                  ),
                )),
                Transform.translate(
                  offset: Offset(250 * slideRight, 0),
                  child: SizedBox(
                    width: 650,
                    child: RepaintBoundary(
                      child: MiniStarSystem(
                        skillScale: skillScale,
                        skillScaleDown: skillScaleDown,
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
}
