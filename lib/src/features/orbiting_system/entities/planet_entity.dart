import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/src/features/orbiting_system/entities/continent_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/cloud_entity.dart';

class PlanetEntity extends CelestialBody {
  late final double verticalRadius;
  double normalizeRadius = 0;
  late final double minY;
  late final double maxY;
  late final double maxSize;
  late final double minSize;
  double angle = 0;
  late final CelestialBody centerObject;
  final double orbitRadius;
  final double initialAngle;
  final Atmosphere? atmosphere;
  final int numberOfClouds;
  final List<ContinentEntity> continents;
  final List<CloudEntity> clouds;
  @override
  PlanetEntity({
    required this.orbitRadius,
    this.initialAngle = 0,
    this.atmosphere,
    this.numberOfClouds = 0,
    this.continents = const [],
    super.name,
    required super.rotationSpeed,
    required super.size,
    required super.color,
  }) : clouds = List.generate(
          numberOfClouds,
          (index) {
            return CloudEntity();
          },
        );

  void init(CelestialBody center, int index) {
    name = name.isEmpty
        ? '${center.name} ${String.fromCharCode(97 + index)}'
        : name;
    centerObject = center;
    angle = initialAngle * (pi / 180);
    verticalRadius = orbitRadius * kOrbitProportion;
    minY = centerObject.worldPosition.dy - verticalRadius;
    maxY = centerObject.worldPosition.dy + verticalRadius;
    normalizeRadius = (orbitRadius + verticalRadius) / (orbitRadius * 2);
    maxSize = size;
    minSize = ((orbitRadius + verticalRadius) / (orbitRadius * 2)) * size;
    _updatePosition();
  }

  @override
  void update(double deltaTime) {
    angle +=
        (simulationSpeed / sqrt(normalizeRadius * orbitRadius) * deltaTime);
    angle %= (2 * pi);
    for (CloudEntity cloud in clouds) {
      cloud.update(deltaTime);
    }
    for (ContinentEntity continent in continents) {
      continent.update(deltaTime, rotationSpeed);
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
