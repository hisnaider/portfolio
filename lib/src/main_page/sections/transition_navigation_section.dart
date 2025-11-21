import 'dart:math';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/main_page/views/star_system/star_system_page.dart';
import 'package:portfolio/src/main_page/widgets/custom_sliver_persistent_header_delegate.dart';
import 'package:portfolio/src/main_page/widgets/text_animation.dart';

class TransitionNavigationSection extends StatelessWidget {
  const TransitionNavigationSection({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    const double threshold = 10000;

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
                return Stack(
                  children: [
                    const _StarSystemTransition(),
                    // Center(
                    //   child: DefaultTextStyle(
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .headlineMedium!
                    //         .copyWith(color: Colors.white),
                    //     child: AnimatedTextKit(
                    //       repeatForever: true,
                    //       animatedTexts: [
                    //         SlideInOutText(
                    //           text:
                    //               'Que bom ver você aqui! Mas o melhor tá por vir. Continue descendo.',
                    //           duration: const Duration(seconds: 1),
                    //           startOffset: const Offset(0, -100),
                    //           endOffset: const Offset(0, 100),
                    //         ),
                    //         SlideInOutText(
                    //           text: 'Só mais um pouquinho…',
                    //           duration: const Duration(seconds: 1),
                    //           startOffset: const Offset(0, -100),
                    //           endOffset: const Offset(0, 100),
                    //         ),
                    //         ScaleShakeText(
                    //           text:
                    //               'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE...',
                    //           duration: const Duration(seconds: 1),
                    //           shakeIntensity: 100,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
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

class _StarSystemTransition extends StatefulWidget {
  const _StarSystemTransition({super.key});

  @override
  State<_StarSystemTransition> createState() => _StarSystemTransitionState();
}

class _StarSystemTransitionState extends State<_StarSystemTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> backgroundOpacity;
  late final Animation<double> starSystemScale;
  late final Animation<double> glowUp;
  late final Animation<double> glowDown;
  late final Animation<double> glowOpacity;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    backgroundOpacity = CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.5, curve: Curves.easeInExpo),
    );
    starSystemScale = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.6, 1),
    );
    glowUp = CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.6, curve: Curves.easeInExpo),
    );
    glowDown = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.6, 1, curve: Curves.easeOutCubic),
    );
    glowOpacity = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.8, 1),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        print('${glowUp.value} - ${glowDown.value}');
        return Stack(
          children: [
            Opacity(
              opacity: backgroundOpacity.value,
              child: Container(
                color: const Color(0xaa030F0F),
              ),
            ),
            Transform.scale(
                scale: starSystemScale.value, child: const StarSystemPage()),
            if (controller.value <= 0.6)
              Center(
                child: Container(
                  height: 10 + (20 * glowUp.value),
                  width: 10 + (20 * glowUp.value),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 1 + Random().nextDouble() * 3,
                      ),
                    ],
                  ),
                ),
              ),
            if (controller.value < 1)
              Opacity(
                opacity: 1 - glowOpacity.value,
                child: Center(
                  child: Container(
                    height: 0,
                    width: 0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(1),
                          blurRadius: 1 + 500 * (glowUp.value - glowDown.value),
                          spreadRadius:
                              5 + 500 * (glowUp.value - glowDown.value),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
