import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/main_page/controller/main_page_controller.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/planet_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/planet_paint.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/star_paint.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TransitionNavigationSection extends StatefulWidget {
  const TransitionNavigationSection({super.key});

  @override
  State<TransitionNavigationSection> createState() =>
      _TransitionNavigationSectionState();
}

class _TransitionNavigationSectionState
    extends State<TransitionNavigationSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> backgroundOpacity;
  late final Animation<double> starSystemScale;
  late final Animation<double> glowUp;
  late final Animation<double> glowDown;
  late final Animation<double> glowOpacity;
  late final Animation<double> firstTextUp;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
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
    firstTextUp = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 0.6, curve: Curves.easeOutCubic),
    );
    controller.addListener(_animationListener);
  }

  void _animationListener() {
    if (controller.status == AnimationStatus.completed) {
      MainPageController.of(context).state.transitionStatus.value =
          TransitionStatus.finished;
    }
  }

  @override
  void dispose() {
    controller.removeListener(_animationListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: VisibilityDetector(
          key: ValueKey('TransitionNavigationSection'),
          onVisibilityChanged: (info) {
            if (info.visibleBounds.bottom == info.size.height) {
              print('qqqqqqqqqqq');
              MainPageController.of(context).state.transitionStatus.value =
                  TransitionStatus.running;
              controller.forward();
            }
          },
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: [
                  Opacity(
                    opacity: backgroundOpacity.value,
                    child: Container(
                      color: const Color(0xaa030F0F),
                    ),
                  ),
                  Transform.scale(
                    scale: starSystemScale.value,
                    child: RepaintBoundary(
                      child: CustomPaint(
                        size: Size.infinite,
                        painter: _SystemPainter(celestialBody: [
                          CelestialBodies.hisnaider,
                          CelestialBodies.raquel,
                          CelestialBodies.formy,
                          CelestialBodies.perroni,
                          CelestialBodies.pinguim,
                          CelestialBodies.ciex,
                        ]),
                      ),
                    ),
                  ),
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
                                blurRadius:
                                    1 + 500 * (glowUp.value - glowDown.value),
                                spreadRadius:
                                    5 + 500 * (glowUp.value - glowDown.value),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Transform.translate(
                      offset: Offset(0, -100 - 50 * firstTextUp.value),
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 250),
                          opacity: firstTextUp.value < 0.5 ? 1 : 0,
                          child: Text(
                            'Que bom ver você aqui! Mas o melhor tá por vir, Aguarde...',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SystemPainter extends CustomPainter {
  final List<CelestialBody> celestialBody;
  const _SystemPainter({required this.celestialBody});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    for (CelestialBody body in celestialBody) {
      if (body is StarEntity) {
        StarPaint(position: Offset.zero + center, star: body, glowFactor: 1)
            .paint(canvas, size);
      } else if (body is PlanetEntity) {
        final double angle = body.initialAngle * (pi / 180) +
            (simulationSpeed / pow(body.orbitRadius, 1)) % (2 * pi);
        final double verticalRadius = body.orbitRadius * kOrbitProportion;
        PlanetPaint(
          position: Offset(
                  body.orbitRadius * cos(angle), verticalRadius * sin(angle)) +
              center,
          planet: body,
          glowFactor: 1,
          zoomFactor: 1,
        ).paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
