import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/src/main_page/controller/analytics.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/camera.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/planet_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';

class StarSystemController {
  Timer? _moveDebounce;
  Timer? _zoomDebounce;
  Timer? _tapDebounce;

  final ValueNotifier<StarSystemConfig> config =
      ValueNotifier(StarSystemConfig());

  final Camera camera;
  late final List<CelestialBody> celestialBodies;
  double _lastScale = 1.0;
  final double _deadzone = 0.02; // 2% de tolerância, evita zoom fantasma

  StarSystemController(
      {required this.camera,
      required StarEntity star,
      required List<PlanetEntity> planets})
      : celestialBodies = [
          star,
          ...planets.asMap().entries.map((entry) {
            final index = entry.key;
            final planet = entry.value;
            planet.init(star, index);
            return planet;
          }),
        ] {
    _moveDebounce?.cancel();
    _zoomDebounce?.cancel();
  }

  void update(double deltaTime, Size screenSize) {
    camera.update(screenSize, deltaTime);

    if (config.value.selectedBody != null) {
      camera.moveToObject(config.value.selectedBody!);
    }
    for (CelestialBody body in celestialBodies) {
      body.update(deltaTime * config.value.simulationSpeed);
    }

    celestialBodies.sort((a, b) => a.depth.compareTo(b.depth));
  }

  void getEvent(PointerEvent event) {
    if (event is PointerHoverEvent) {
      _isMouseHovered(event.position);
    } else if (event is PointerScrollEvent) {
      if (config.value.selectedBody == null) {
        final double delta = 1 - (event.scrollDelta.dy * 0.0025);
        print(delta);
        camera.zoomUpdate(delta);
      }
    } else if (event is PointerMoveEvent) {
      if (config.value.selectedBody == null) {
        camera.move(event.delta);
        _getMoveEvent();
      }
    } else if (event is PointerDownEvent) {
      selectCelestialBody(config.value.hoveredBody);
      _getTapEvent();
    }
  }

  void getGestureEvent(Diagnosticable event) {
    if (event is ScaleStartDetails) {
      _lastScale = 1.0;
    } else if (event is ScaleUpdateDetails) {
      final scale = event.scale;
      final deltaScale = scale - _lastScale;
      if (deltaScale.abs() < _deadzone) return;
      final double multiplier = 1.0 + deltaScale;
      camera.zoomUpdate(multiplier);
      _lastScale = scale;
      _getZoomEvent(scale);
    } else if (event is ScaleEndDetails) {
      _lastScale = 1.0;
    } else if (event is TapDownDetails) {
      _isMouseHovered(event.globalPosition);
      selectCelestialBody(config.value.hoveredBody);

      _getTapEvent();
    }
  }

  void selectCelestialBody(CelestialBody? hoveredBody) {
    if (config.value.selectedBody == null && hoveredBody != null) {
      config.value =
          config.value.copyWith(selectedBody: hoveredBody, showUi: false);
      camera.setAnimation(100, 1);
      Analytics.instance.getPlanetEvent(
          action: 'celestial_body_selected',
          planet: config.value.selectedBody!.name);
    }
  }

  void unselectCelestialBody() {
    config.value = config.value
        .copyWith(selectedBody: null, showUi: true, hoveredBody: null);
    camera.setAnimation(5, 0.1);
  }

  void _getZoomEvent(double delta) {
    _zoomDebounce?.cancel();
    _zoomDebounce = Timer(const Duration(milliseconds: 150), () {
      if (delta > 1) {
        Analytics.instance.getInteractionsEvent(
            event: 'camera_zoom_in',
            planetUnderCursos: config.value.hoveredBody?.name);
      } else if (delta < 1) {
        Analytics.instance.getInteractionsEvent(
            event: 'camera_zoom_out',
            planetUnderCursos: config.value.hoveredBody?.name);
      }
    });
  }

  void _getMoveEvent() {
    _moveDebounce?.cancel();
    _moveDebounce = Timer(const Duration(milliseconds: 150), () {
      Analytics.instance.getInteractionsEvent(
          event: 'camera_move',
          planetUnderCursos: config.value.hoveredBody?.name);
    });
  }

  void _getTapEvent() {
    _tapDebounce?.cancel();
    _tapDebounce = Timer(const Duration(milliseconds: 150), () {
      Analytics.instance.getInteractionsEvent(
          event: 'interaction_tap',
          planetUnderCursos: config.value.hoveredBody?.name);
    });
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
