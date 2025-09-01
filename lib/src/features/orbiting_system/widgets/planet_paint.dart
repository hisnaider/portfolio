import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/draw_celestial_body_image.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'dart:ui' as ui;

class PlanetPaint extends CustomPainter {
  final PlanetEntity planet;
  final Offset localPosition;
  final double deltaTime;
  const PlanetPaint({
    required this.planet,
    required this.localPosition,
    required this.deltaTime,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()..color = planet.color;
    planet.update(deltaTime);
    if (planet.glowStyle != null) {
      final glowPaint = Paint()
        ..color = planet.color.withOpacity(planet.glowStyle!.glowOpacity)
        ..maskFilter = MaskFilter.blur(
            planet.glowStyle!.blurStyle, planet.glowStyle!.sigma);

      // Primeiro desenha o brilho (círculo maior e borrado)
      canvas.drawCircle(localPosition, planet.size + 10, glowPaint);
    }
    canvas.drawCircle(localPosition, planet.scale, dotPaint);
    if (planet.image != null) {
      canvas.drawCelestialBodyImage(
        center: localPosition,
        scale: planet.scale,
        image: planet.image!,
        imageStyle: planet.imageStyle,
        paint: dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
