import 'dart:math';
import 'dart:ui';

import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/src/features/orbiting_system/entities/celestial_body.dart';

class PlanetEntity extends CelestialBody {
  final double horizontalRadius;
  final double initialAngle;
  late final double verticalRadius;
  late final double normalizeRadius;
  late final double minY;
  late final double maxY;
  late final double maxSize;
  late final double minSize;
  double scale = 0;
  double angle = 0;

  PlanetEntity({
    required this.horizontalRadius,
    required super.size,
    this.initialAngle = 0,
    super.center,
    required super.color,
    super.image,
    super.imageStyle,
    super.glowStyle,
  }) {
    _init();
  }

  void _init() {
    angle = initialAngle * (pi / 180);
    verticalRadius = horizontalRadius * kOrbitProportion;
    minY = center.dy - verticalRadius;
    maxY = center.dy + verticalRadius;
    normalizeRadius =
        (horizontalRadius + verticalRadius) / (horizontalRadius * 2);
    maxSize = size;
    minSize =
        ((horizontalRadius + verticalRadius) / (horizontalRadius * 2)) * size;
    _updatePosition();
  }

  void update(double deltaTime) {
    angle += (simulationSpeed /
        sqrt(normalizeRadius * horizontalRadius) *
        deltaTime);
    angle %= (2 * pi);

    _updatePosition();
  }

  void _updatePosition() {
    final x = center.dx + horizontalRadius * cos(angle);
    final y = center.dy + verticalRadius * sin(angle);
    depth = sin(angle) * horizontalRadius;
    scale = minSize + ((y - minY) / (maxY - minY)) * (maxSize - minSize);
    position = Offset(x, y);
  }
}
