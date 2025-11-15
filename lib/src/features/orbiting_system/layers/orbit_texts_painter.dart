import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';

class OrbitTextsPainter extends StatelessWidget {
  final List<CelestialBody> celestialBody;
  final double elapsed;
  final double deltaTime;
  final Camera camera;
  final bool showPlanetName;
  const OrbitTextsPainter(
      {super.key,
      required this.celestialBody,
      required this.elapsed,
      required this.deltaTime,
      required this.camera,
      required this.showPlanetName});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showPlanetName ? 1 : 0,
      duration: const Duration(milliseconds: 250),
      child: IgnorePointer(
        child: CustomPaint(
          size: Size.infinite,
          painter:
              _OrbitTextsPainter(celestialBody, elapsed, deltaTime, camera),
        ),
      ),
    );
  }
}

class _OrbitTextsPainter extends CustomPainter {
  final List<CelestialBody> celestialBody;
  final double elapsed;
  final double deltaTime;
  final Camera camera;

  _OrbitTextsPainter(
    this.celestialBody,
    this.elapsed,
    this.deltaTime,
    this.camera,
  );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(camera.offset.dx, camera.offset.dy);
    for (CelestialBody body in celestialBody) {
      final Offset localPosition = camera.worldToScreen(body.worldPosition);
      if (body is PlanetEntity) {
        final TextPainter textPainter = TextPainter(
          textAlign: TextAlign.right,
          textDirection: TextDirection.ltr,
          maxLines: 1,
        );
        textPainter.text = TextSpan(
            style: MyTextTheme.dark.titleSmall!.copyWith(fontSize: 18),
            text: body.name);
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            (localPosition.dx * camera.zoom - (textPainter.width / 2)),
            ((localPosition.dy - body.size - 0.5) * camera.zoom -
                textPainter.height),
          ),
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _OrbitTextsPainter oldDelegate) =>
      oldDelegate.elapsed != elapsed;
}
