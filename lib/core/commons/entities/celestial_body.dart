import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/transform_position.dart';

abstract class CelestialBody<T extends CelestialBodyConfig> {
  final String name;
  final int id;
  double depth = 0;
  Offset worldPosition = const Offset(0, 0);
  final TransformPosition transformPosition = TransformPosition();
  final T config;

  double get size => config.size;
  Color get color => config.color;

  CelestialBody({
    required this.name,
    required this.id,
    required this.config,
  });
}

abstract class CelestialBodyConfig {
  final double size;
  final double rotationSpeed;
  final Color color;
  const CelestialBodyConfig({
    required this.size,
    required this.color,
    this.rotationSpeed = 0.5,
  });
}
