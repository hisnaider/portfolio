import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/draw_celestial_body_image.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'dart:ui' as ui;

import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';

class StartPaint extends CustomPainter {
  final StarEntity star;
  final Offset localPosition;
  final double deltaTime;
  const StartPaint({
    required this.star,
    required this.localPosition,
    required this.deltaTime,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()..color = star.color;

    ///planet.update(deltaTime);
    final glowPaint = Paint()
      ..color = star.color.withOpacity(star.glowStyle!.glowOpacity)
      ..maskFilter =
          MaskFilter.blur(star.glowStyle!.blurStyle, star.glowStyle!.sigma);

    // Primeiro desenha o brilho (círculo maior e borrado)
    canvas.drawCircle(localPosition, star.size + 10, glowPaint);
    canvas.drawCircle(localPosition, star.size, dotPaint);
    if (star.image != null) {
      canvas.drawCelestialBodyImage(
        center: localPosition,
        scale: star.size,
        image: star.image!,
        imageStyle: star.imageStyle,
        paint: dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
