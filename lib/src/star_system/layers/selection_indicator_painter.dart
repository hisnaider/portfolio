import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/commons/extensions/canvas_extensions.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/star_system/entities/camera.dart';

class SelectionIndicatorPainter extends CustomPainter {
  final List<CelestialBody> celestialBody;
  final double elapsed;
  final Camera camera;
  final CelestialBody? hoveredBody;

  SelectionIndicatorPainter(
    this.celestialBody,
    this.elapsed,
    this.camera,
    this.hoveredBody,
  );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(camera.offset.dx, camera.offset.dy);
    canvas.scale(camera.zoom);
    for (CelestialBody body in celestialBody) {
      final double circleSize = min(
          (body.size + kHoverIndicator) - (75 * camera.zoomFactor),
          kHoverIndicator);
      if (circleSize > body.size) {
        final circlePaint = Paint()
          ..color =
              hoveredBody?.id == body.id ? MyColors.primary : Colors.white30
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.25;
        canvas.drawDashedCircle(
          camera.worldToScreen(body.worldPosition),
          circleSize,
          segments: 3,
          rotation: elapsed * 0.1,
          gapProportion: 0.25,
          paint: circlePaint,
        );
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SelectionIndicatorPainter oldDelegate) =>
      oldDelegate.elapsed != elapsed;
}
