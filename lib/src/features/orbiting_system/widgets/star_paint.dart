import 'dart:math';

import 'package:flutter/material.dart';

import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';

class StarPaint extends CustomPainter {
  final Offset position;
  final StarEntity star;
  final double glowFactor;
  const StarPaint({
    required this.position,
    required this.star,
    required this.glowFactor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final glowPaint = Paint()
      ..color =
          star.layers.first.color.withOpacity(star.glow.intensity * glowFactor)
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, star.glow.radius * glowFactor);
    final Path coronaPath = Path();
    final List<CoronaSpike> spikes = star.solarCorona.spikes;

    for (int i = 0; i < spikes.length; i++) {
      final prev =
          position + spikes[(i - 1 + spikes.length) % spikes.length].point;
      final current = position + spikes[i].point;
      final next = position + spikes[(i + 1) % spikes.length].point;
      final maxRadius = _calculateMaxRadiusForPoint(prev, current, next);
      final normalized = (star.size * 0.05 / maxRadius).clamp(0.0, 1.0);
      final finalRadius = normalized * maxRadius;
      final p1 = _moveAlong(current, prev, finalRadius);
      final p2 = _moveAlong(current, next, finalRadius);
      if (i == 0)
        coronaPath.moveTo(p1.dx, p1.dy);
      else
        coronaPath.lineTo(p1.dx, p1.dy);
      coronaPath.quadraticBezierTo(current.dx, current.dy, p2.dx, p2.dy);
    }

    coronaPath.close();

    final paint = Paint()
      ..color = star.layers.first.color.withOpacity(0.25)
      ..style = PaintingStyle.fill;

    canvas.drawPath(coronaPath, paint);
    canvas.drawCircle(
        position, star.size + star.glow.radius * glowFactor, glowPaint);
    canvas.drawCircle(position, star.size, Paint()..color = star.color);
    for (StarLayer layer in star.layers) {
      canvas.drawCircle(position, layer.size, Paint()..color = layer.color);
    }
    // canvas.drawCircle(
    //     position,
    //     star.size + 5,
    //     Paint()
    //       ..color = star.layers.first.color.withOpacity(glowFactor)
    //       ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2));
  }

  Offset _moveAlong(Offset start, Offset end, double distance) {
    final dir = (end - start);
    final len = dir.distance;
    if (len == 0) return start;
    return start + dir / len * distance;
  }

  double _calculateMaxRadiusForPoint(Offset prev, Offset current, Offset next) {
    final dPrev = (current - prev).distance;
    final dNext = (current - next).distance;
    return (dPrev < dNext ? dPrev : dNext) / 2.0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
