import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/planet_paint.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/start_paint.dart';

class OrbitTextsPainter extends CustomPainter {
  final List<CelestialBody> celestialBody;
  final double elapsed;
  final double deltaTime;
  final Camera camera;

  OrbitTextsPainter(
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
  bool shouldRepaint(covariant OrbitTextsPainter oldDelegate) =>
      oldDelegate.elapsed != elapsed;
}
