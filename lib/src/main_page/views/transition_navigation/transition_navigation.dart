import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/planet_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/planet_paint.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/star_paint.dart';

class TransitionNavigationSection extends StatelessWidget {
  const TransitionNavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Stack(
          children: [
            _StarSystemTransition(),
          ],
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

class _StarSystemTransition extends StatefulWidget {
  const _StarSystemTransition();

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
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
