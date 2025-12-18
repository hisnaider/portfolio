// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:portfolio/core/values/constants.dart';

class ContinentEntity {
  final List<Offset> points;
  late final double initialOffsetX;
  double offsetX;
  double width;
  final Color color;
  final double radius;
  late final Path path;

  ContinentEntity(
      {this.color = Colors.green,
      this.radius = 1,
      required List<Offset> rawPoints})
      : offsetX = rawPoints.map((p) => p.dx).reduce((a, b) => a < b ? a : b),
        width = rawPoints.map((p) => p.dx).reduce((a, b) => a > b ? a : b) -
            rawPoints.map((p) => p.dx).reduce((a, b) => a < b ? a : b),
        points = (() {
          final minDx =
              rawPoints.map((p) => p.dx).reduce((a, b) => a < b ? a : b);
          return rawPoints
              .map((p) => Offset(p.dx - minDx, p.dy)) // normaliza pro zero
              .toList();
        })() {
    _init();
  }

  void _init() {
    initialOffsetX = offsetX;
    path = Path();
    if (points.isEmpty) return;

    for (int i = 0; i < points.length; i++) {
      final prev = points[(i - 1 + points.length) % points.length];
      final current = points[i];
      final next = points[(i + 1) % points.length];
      final maxRadius = _calculateMaxRadiusForPoint(prev, current, next);
      final normalized = (radius * 0.1 / maxRadius).clamp(0.0, 1.0);
      final finalRadius = normalized * maxRadius;
      final p1 = _moveAlong(current, prev, finalRadius);
      final p2 = _moveAlong(current, next, finalRadius);

      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }

      path.quadraticBezierTo(current.dx, current.dy, p2.dx, p2.dy);
    }

    path.close();
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

  void update(double deltaTime, double speed) {
    offsetX -= deltaTime * speed * simulationSpeed; // desliza para a esquerda

    // quando o continente saiu totalmente da tela, reaparece à direita
    if (offsetX + width < 0) {
      offsetX = 2.0 - width; // ou a posição inicial que você definir
    }
  }

  @override
  String toString() {
    return 'ContinentEntity(points: $points, offsetX: $offsetX, width: $width, color: $color, radius: $radius)';
  }
}
