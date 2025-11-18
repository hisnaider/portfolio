import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/main_page/views/star_system/star_system_page.dart';
import 'package:portfolio/src/main_page/widgets/custom_sliver_persistent_header_delegate.dart';

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
          final double progress = (shrinkOffset / threshold).clamp(0, 1);
          final double firtTextTransition = progress.normalize(0.1, min: 0.15);
          final double secondTextTransition =
              pow(sin(pi * progress.normalize(0.2, min: 0.4)), 0.5) as double;
          return SizedBox(
            height: screenHeight,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    _StarSystemTransition(progress: progress),
                    Transform.translate(
                      offset: Offset(0, 50 * firtTextTransition),
                      child: Opacity(
                        opacity: firtTextTransition,
                        child: Center(
                            child: Text(
                          'Que bom ver você aqui! Mas o melhor tá por vir. Continue descendo.',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        )),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 50 * secondTextTransition),
                      child: Opacity(
                        opacity: secondTextTransition,
                        child: Center(
                            child: Text(
                          'Só mais um pouquinho…',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        )),
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

class _StarSystemTransition extends StatelessWidget {
  const _StarSystemTransition({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    final backgroundOpacity =
        Curves.easeInExpo.transform(progress.normalize(0.5, min: 0));

    final starSystemSize = progress.normalize(1, min: 0.6);

    final glowSizeUp =
        Curves.easeInExpo.transform(progress.normalize(0.6, min: 0.0));
    final glowSizeDown =
        Curves.easeOutCubic.transform(progress.normalize(1, min: 0.6));
    final glowOpacity = progress.normalize(0.8, min: 1);
    return Stack(
      children: [
        Opacity(
          opacity: backgroundOpacity,
          child: Container(
            color: const Color(0xaa030F0F),
          ),
        ),
        Transform.scale(scale: starSystemSize, child: StarSystemPage()),
        if (progress <= 0.6)
          Center(
            child: Container(
              height: 10 + (20 * glowSizeUp),
              width: 10 + (20 * glowSizeUp),
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
        if (progress < 1)
          Opacity(
            opacity: glowOpacity,
            child: Center(
              child: Container(
                height: 0,
                width: 0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(1),
                      blurRadius: 1 + 500 * (glowSizeUp - glowSizeDown),
                      spreadRadius: 5 + 500 * (glowSizeUp - glowSizeDown),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
