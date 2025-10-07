import 'package:flutter/material.dart';

import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';

class StartPaint extends CustomPainter {
  final Offset position;
  final StarEntity star;
  final double glowFactor;
  const StartPaint({
    required this.position,
    required this.star,
    required this.glowFactor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()..color = star.color;
    final glowPaint = Paint()
      ..color = star.glow.color.withOpacity(star.glow.intensity * glowFactor)
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, star.glow.radius * glowFactor);

    canvas.drawCircle(
        position, star.size + star.glow.radius * glowFactor, glowPaint);
    canvas.drawCircle(position, star.size, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
