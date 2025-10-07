import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/cloud_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_system_config.dart';

class StarSystemController {
  final ValueNotifier<StarSystemConfig> config =
      ValueNotifier(StarSystemConfig());
  final StarConfig _initialStarConfig;
  final List<PlanetConfig> _initialPlanetsConfig;
  final Camera camera;
  late final StarEntity star;
  late final List<PlanetEntity> planets;
  late final List<CelestialBody> celestialBodies = [];

  StarSystemController(
      {required this.camera,
      required StarConfig star,
      required List<PlanetConfig> planets})
      : _initialPlanetsConfig = planets,
        _initialStarConfig = star {
    _init();
  }

  void _init() {
    star = StarEntity(
      name: _initialStarConfig.name,
      config: _initialStarConfig,
      id: 0,
    );
    planets = List.generate(
      _initialPlanetsConfig.length,
      (index) {
        return PlanetEntity(
            name: _initialPlanetsConfig[index].name.isEmpty
                ? '${_initialStarConfig.name} ${String.fromCharCode(97 + index)}'
                : _initialPlanetsConfig[index].name,
            centerObject: star,
            config: _initialPlanetsConfig[index],
            id: index + 1,
            clouds: List.generate(
              _initialPlanetsConfig[index].numberOfClouds,
              (index) {
                return CloudEntity();
              },
            ));
      },
    );
    celestialBodies.addAll([star, ...planets]);
  }

  void update(double deltaTime, Size screenSize) {
    camera.update(screenSize, deltaTime);
    if (config.value.selectedBody != null) {
      camera.moveToObject(config.value.selectedBody!);
    }
    for (PlanetEntity planet in planets) {
      planet.update(deltaTime);
    }

    celestialBodies.sort((a, b) => a.depth.compareTo(b.depth));
  }

  void getEvent(PointerEvent event) {
    if (event is PointerHoverEvent) {
      _isMouseHovered(event.position);
    } else if (event is PointerScrollEvent) {
      if (config.value.selectedBody == null) {
        final double delta = 1 - (event.scrollDelta.dy * 0.0025);
        camera.zoomUpdate(delta);
      }
    } else if (event is PointerMoveEvent) {
      if (config.value.selectedBody == null) {
        camera.move(event.delta);
      }
    } else if (event is PointerDownEvent) {
      if (config.value.selectedBody == null &&
          config.value.hoveredBody != null) {
        config.value =
            config.value.copyWith(selectedBody: config.value.hoveredBody);
        camera.setAnimation(100, 1);
      }
    }
  }

  void unselectCelestialBody() {
    config.value = config.value.copyWith(selectedBody: null);
    camera.setAnimation(5, 0.1);
  }

  void _isMouseHovered(Offset position) {
    CelestialBody? found;
    for (final body in celestialBodies) {
      final radius = max(
          body.size, (body.size + kHoverIndicator) - (75 * camera.zoomFactor));
      final distance = (camera.screenToWorld(position) -
              camera.worldToScreen(body.worldPosition))
          .distance;

      if (distance <= radius) {
        found = body;
        break; // opcional: se quiser pegar só o primeiro que encontrar
      }
    }
    config.value = config.value.copyWith(
      hoveredBody: found,
    );
  }
}
