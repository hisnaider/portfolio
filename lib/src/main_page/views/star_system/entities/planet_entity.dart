import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/continent_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/cloud_entity.dart';

class PlanetEntity extends CelestialBody {
  late final double verticalRadius;
  double normalizeRadius = 0;
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
    required super.aboutInfo,
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
    normalizeRadius = (orbitRadius + verticalRadius) / (orbitRadius * 2);
    _updatePosition();
  }

  @override
  void update(double deltaTime) {
    angle += (simulationSpeed / pow(orbitRadius, 1)) * deltaTime * 25;
    angle %= (2 * pi);
    updateClouds(deltaTime);
    updateContinents(deltaTime);
    _updatePosition();
  }

  void updateContinents(double deltaTime) {
    for (ContinentEntity continent in continents) {
      continent.update(deltaTime, rotationSpeed);
    }
  }

  void updateClouds(double deltaTime) {
    for (CloudEntity cloud in clouds) {
      cloud.update(deltaTime);
    }
  }

  void _updatePosition() {
    final x = centerObject.worldPosition.dx + orbitRadius * cos(angle);
    final y = centerObject.worldPosition.dy + verticalRadius * sin(angle);
    depth = sin(angle) * orbitRadius;
    worldPosition = Offset(x, y);
  }
}
