import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/src/features/orbiting_system/entities/continent_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/cloud_entity.dart';

class PlanetEntity extends CelestialBody<PlanetConfig> {
  late final double verticalRadius;
  late final double normalizeRadius;
  late final double minY;
  late final double maxY;
  late final double maxSize;
  late final double minSize;
  double angle = 0;
  final CelestialBody centerObject;
  final List<CloudEntity> clouds;

  Atmosphere? get atmosphere => config.atmosphere;
  double get orbitRadius => config.orbitRadius;
  @override
  PlanetEntity({
    required this.centerObject,
    this.clouds = const [],
    required super.name,
    required super.id,
    required super.config,
  }) {
    _init();
  }

  void _init() {
    angle = config.initialAngle * (pi / 180);
    verticalRadius = orbitRadius * kOrbitProportion;
    minY = centerObject.worldPosition.dy - verticalRadius;
    maxY = centerObject.worldPosition.dy + verticalRadius;
    normalizeRadius = (orbitRadius + verticalRadius) / (orbitRadius * 2);
    maxSize = size;
    minSize = ((orbitRadius + verticalRadius) / (orbitRadius * 2)) * size;
    _updatePosition();
  }

  void update(double deltaTime) {
    angle +=
        (simulationSpeed / sqrt(normalizeRadius * orbitRadius) * deltaTime);
    angle %= (2 * pi);
    for (CloudEntity cloud in clouds) {
      cloud.update(deltaTime);
    }
    for (ContinentEntity continent in config.continents) {
      continent.update(deltaTime, config.rotationSpeed);
    }
    _updatePosition();
  }

  void _updatePosition() {
    final x = centerObject.worldPosition.dx + orbitRadius * cos(angle);
    final y = centerObject.worldPosition.dy + verticalRadius * sin(angle);
    depth = sin(angle) * orbitRadius;
    worldPosition = Offset(x, y);
  }
}

class PlanetConfig extends CelestialBodyConfig {
  final String name;
  final double orbitRadius;
  final double initialAngle;
  final Atmosphere? atmosphere;
  final int numberOfClouds;
  final List<ContinentEntity> continents;
  const PlanetConfig({
    this.name = '',
    required this.orbitRadius,
    required super.size,
    required super.color,
    this.initialAngle = 0,
    this.atmosphere,
    this.numberOfClouds = 0,
    super.rotationSpeed,
    this.continents = const [],
  });
}
