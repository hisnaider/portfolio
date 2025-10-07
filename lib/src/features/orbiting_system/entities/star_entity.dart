import 'dart:ui';

import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';

class StarEntity extends CelestialBody<StarConfig> {
  StarEntity({
    required super.name,
    required super.id,
    required super.config,
  });

  StarGlow get glow => config.glow;

  void setWorldPosition(Offset position) {
    worldPosition = position;
  }
}

class StarConfig extends CelestialBodyConfig {
  final StarGlow glow;
  final String name;
  StarConfig({
    required this.glow,
    required this.name,
    required super.size,
    required super.color,
  });
}
