import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/src/star_system/entities/camera.dart';
import 'package:portfolio/src/star_system/entities/planet_entity.dart';
import 'package:portfolio/src/star_system/entities/star_entity.dart';
import 'package:portfolio/src/star_system/widgets/planet_paint.dart';
import 'package:portfolio/src/star_system/widgets/star_paint.dart';

class StarSystemPainter extends CustomPainter {
  final List<CelestialBody> celestialBody;
  final double elapsed;
  final double deltaTime;
  final Camera camera;
  final String? hovered;

  StarSystemPainter(
    this.celestialBody,
    this.elapsed,
    this.deltaTime,
    this.camera,
    this.hovered,
  );

  @override
  void paint(Canvas canvas, Size size) {
    ///final center = Offset(size.width / 2, size.height / 2);
    canvas.save();
    canvas.translate(camera.offset.dx, camera.offset.dy);
    canvas.scale(camera.zoom);

    // canvas.drawRect(
    //     Rect.fromLTWH(
    //       camera.transformPosition.left,
    //       camera.transformPosition.top,
    //       camera.transformPosition.width,
    //       camera.transformPosition.height,
    //     ),
    //     Paint()
    //       ..color = Colors.red
    //       ..style = PaintingStyle.stroke);

    for (CelestialBody body in celestialBody) {
      final Offset localPosition = camera.worldToScreen(body.worldPosition);
      if (body is StarEntity) {
        StarPaint(
                position: localPosition,
                star: body,
                glowFactor: glowFactor(camera, 0.15))
            .paint(canvas, size);
      } else if (body is PlanetEntity) {
        if (camera.isInCameraView(localPosition, body.size)) {
          PlanetPaint(
            position: localPosition,
            planet: body,
            glowFactor: glowFactor(camera, 0.5),
            zoomFactor: camera.zoomFactor,
          ).paint(canvas, size);
        }
      }
    }
    // canvas.drawCircle(camera.transformPosition.center, 5 / camera.zoom,
    //     Paint()..color = Colors.red);
    // final width = size.width - (kWorkDescContainer + kWorkDescMargin * 3);
    // final height = size.height - (kWorkDescMargin * 2);
    // final left = (kWorkDescMargin - camera.offset.dx) / camera.zoom;
    // final top = (40 - camera.offset.dy) / camera.zoom;
    // final right = (kWorkDescMargin + width - camera.offset.dx) / camera.zoom;
    // final bottom = (40 + height - camera.offset.dy) / camera.zoom;

    // canvas.drawRect(
    //     Rect.fromLTRB(
    //       left,
    //       top,
    //       right,
    //       bottom,
    //     ),
    //     Paint()
    //       ..color = Colors.green
    //       ..style = PaintingStyle.stroke);
    // canvas.drawLine(
    //   Offset((width / 2 + 40 - camera.offset.dx) / camera.zoom, top),
    //   Offset((width / 2 + 40 - camera.offset.dx) / camera.zoom, bottom),
    //   Paint()..color = Colors.orange,
    // );
    // canvas.drawLine(
    //   Offset(left, (height / 2 + 40 - camera.offset.dy) / camera.zoom),
    //   Offset(right, (height / 2 + 40 - camera.offset.dy) / camera.zoom),
    //   Paint()..color = Colors.orange,
    // );
    canvas.restore();
  }

  double glowFactor(Camera camera, double maxFactor) {
    final t = ((camera.zoom - camera.minZoom) /
            (camera.maxZoom * maxFactor - camera.minZoom))
        .clamp(0.0, 1.0);
    return 1 - t;
  }

  @override
  bool shouldRepaint(covariant StarSystemPainter oldDelegate) =>
      oldDelegate.elapsed != elapsed;
}
