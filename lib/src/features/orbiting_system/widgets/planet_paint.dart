import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/canvas_extensions.dart';
import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/features/orbiting_system/entities/cloud_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';

class PlanetPaint extends CustomPainter {
  final Offset position;
  final PlanetEntity planet;
  final double elapsedTime;
  final bool hoveredPlanet;
  final double glowFactor;
  final double zoomFactor;
  final double zoom;
  const PlanetPaint({
    required this.position,
    required this.planet,
    required this.elapsedTime,
    required this.hoveredPlanet,
    required this.glowFactor,
    required this.zoomFactor,
    required this.zoom,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = hoveredPlanet ? MyColors.primary : Colors.white30
      ..style = PaintingStyle.stroke;

    canvas.drawDashedCircle(
      position,
      (planet.size + kHoverIndicator) - (75 * zoomFactor),
      segments: 4,
      rotation: elapsedTime * 0.1,
      gapProportion: 0.25,
      paint: circlePaint,
    );

    canvas.save(); // salva o estado atual

    canvas.clipPath(
      Path()
        ..addOval(
          Rect.fromCircle(center: position, radius: planet.size),
        ),
    );

    final dotPaint = Paint()..color = planet.color;

    canvas.drawCircle(position, planet.size, dotPaint);

    if (zoomFactor > 0.05) {
      final diameter = planet.size * 2;

      for (final continent in planet.continents) {
        final matrix = Matrix4.identity()
          ..translate(
            position.dx - planet.size + continent.offsetX * diameter,
            position.dy - planet.size,
          )
          ..scale(diameter, diameter); // aplica o scale
        final transformedPath = continent.path.transform(matrix.storage);
        canvas.drawPath(transformedPath, Paint()..color = continent.color);
      }

      for (CloudEntity cloud in planet.clouds) {
        final size = 0.25 * planet.size;
        final x = position.dx - planet.size + cloud.dx * diameter;
        final y = (cloud.dy * diameter + position.dy - planet.size) - size / 2;
        final double cloudWidth = cloud.width * diameter;
        final rrect = RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, cloudWidth, size),
          Radius.circular(8), // raio da borda
        );
        canvas.drawRRect(rrect, Paint()..color = Colors.white70);
      }
    }

    canvas.restore(); // restaura pro estado sem clip

    if (planet.atmosphere != null) {
      final atmosphere = planet.atmosphere!;

      final glowPaint = Paint()
        ..color = atmosphere.color.withOpacity(atmosphere.density * glowFactor)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          (atmosphere.height.toDouble() * 0.1) *
              glowFactor, // controla o "espalhamento"
        );

      final glowRadius = planet.size + (atmosphere.height * 0.5) * glowFactor;

      // desenha o glow
      final atmosphereHalo = atmosphere.height * 0.1;
      canvas.drawCircle(position, glowRadius, glowPaint);
      canvas.drawCircle(
          position,
          planet.size + atmosphereHalo / 2,
          Paint()
            ..strokeWidth = atmosphereHalo
            ..style = PaintingStyle.stroke
            ..color = atmosphere.color.withOpacity(0.2));
    }
    // canvas.drawLine(
    //   Offset(position.dx, 0),
    //   Offset(position.dx, size.height),
    //   Paint()..color = Colors.red,
    // );
    // canvas.drawLine(
    //   Offset(0, position.dy),
    //   Offset(size.width, position.dy),
    //   Paint()..color = Colors.red,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
