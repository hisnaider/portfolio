import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:portfolio/src/features/orbiting_system/entities/celestial_body.dart';

extension DrawCelestialBodyImage on Canvas {
  void drawCelestialBodyImage({
    required Offset center,
    required double scale,
    required ui.Image image,
    required ImageStyle imageStyle,
    required Paint paint,
  }) {
    save();

    final clip = Path()
      ..addOval(Rect.fromCircle(center: center, radius: scale));
    clipPath(clip);

    final imageRect = Rect.fromCenter(
      center: center + imageStyle.position,
      width: scale * imageStyle.scale,
      height: scale * imageStyle.scale,
    );

    final imageSrcRect =
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());

    drawImageRect(
        image, imageSrcRect, imageRect, paint..colorFilter = imageStyle.color);

    restore();
  }
}
